import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawchar_project/src/controller/productController.dart';
import 'package:kawchar_project/src/model/productData.dart';
import 'package:kawchar_project/src/pages/detailsPage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //to fetch product and show we initial productController
  final productController=Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text("Kawchar's project"),
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        child: GetX<ProductController>(
          builder: (controller){
            if(controller.isLoading.value){
              return Center(child: CircularProgressIndicator());          //if loading is true then show a loader
            }
            else if(controller.isLoading.value==false && controller.products.isEmpty){
              return Center(child: Text('There is no products'));               //if there is no data then show this text
            }
            else{
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index){
                  return buildProduct(size, controller.products[index]);
                },
              );
            }
          },
        ),
        onRefresh: ()async{

          //to refresh data
          productController.getData();

        },
      ),
    );
  }

  Widget buildProduct(Size size, ProductData productData){
    return InkWell(
      onTap: (){
        Get.to(DetailsPage(productData: productData,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [

              ///here is out product image
              Container(
                width: size.height/8,
                height: size.height/8,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  child: Image.network(
                    '${productData.imageLink}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ///here is product name , price and rating
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //product name here
                        Text(
                          "${productData.name}",
                          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.8), fontSize: 16),
                        ),

                        //product price here
                        SizedBox(height: size.height*0.01,),
                        Text("\$ ${productData.price}", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),),

                        //product rating here
                        SizedBox(height: size.height*0.005,),
                        Text("${productData.rating} *", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),),

                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
