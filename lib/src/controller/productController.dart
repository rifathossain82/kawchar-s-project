import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/productData.dart';

class ProductController extends GetxController{

  var products=<ProductData>[].obs;
  var isLoading=true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData()async{
    try{
      var data;
      isLoading(true);

      var response=await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

      print(response.statusCode);
      print(response.body);

      if(response.statusCode==200){
        isLoading(false);
        products.value=[];
        data=jsonDecode(response.body.toString());
        for(Map i in data){
          print(i);
          products.add(ProductData.fromJson(i));
          products.refresh();
        }
      }
      else{
        isLoading(false);
        throw Exception('No data found');
      }

    }catch(e){
      isLoading(false);
      print(e);
    }
  }

}