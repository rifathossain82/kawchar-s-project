import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawchar_project/src/model/productData.dart';

import '../controller/productController.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.productData}) : super(key: key);

  ProductData productData;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //here is product image, name, price and rating
              Row(
                children: [

                  ///here is out product image
                  Container(
                    width: size.width*0.5,
                    height: size.height*0.2,
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

              //here is product description
              SizedBox(height: size.height*0.03,),
              buildText("${productData.description}"),

              //here is product category
              SizedBox(height: size.height*0.03,),
              buildText("Category: ${productData.category}"),

              //here is product brand
              SizedBox(height: size.height*0.03,),
              buildText("Brand: ${productData.brand}"),

              //here is product product type
              SizedBox(height: size.height*0.03,),
              buildText("Product Type: ${productData.productType}"),

              //here is product available colors
              SizedBox(height: size.height*0.03,),
              productData.productColors!.isEmpty? Container() : buildText("Available Colors"),
              SizedBox(height: size.height*0.01,),
              SizedBox(
                height: 30,
                width: size.width,
                child: buildProductColor(productData.productColors!)
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget buildProductColor(List<ProductColor> productColor){
    List<ProductColor> tempList=[];
    for(int i=0; i<productColor.length; i++){
      tempList.add(productColor[i]);
    }
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: tempList.length,
      itemBuilder: (context, index){
        return buildColor(tempList[index].hex_value.toString());
      },
    );
  }

  Widget buildText(String txt){
    return Text(txt);
  }

  Widget buildColor(String hex_value){
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Container(
        height: 30,
        width: 30,
        color: hex_value.hexToColor(),
      ),
    );
  }
}

extension HexToColor on String {
  Color hexToColor() {
    return Color(
        int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000);
  }
}