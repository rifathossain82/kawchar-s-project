import 'package:get/get.dart';

class StudentController extends GetxController{
  var isloading=false.obs;
  var name="kawchar".obs;
  var age = 24.obs;
  var count=0.obs;

  void increment(){
    count++;
  }

  void changeText(){
    if(name.contains("kawchar")){
      name.value=name.value.toUpperCase();
    }else{
      name.value=name.value.toLowerCase();
    }
  }
}