import 'package:get/get.dart';

class StudentController extends GetxController{
  var isloading=false.obs;
  var name="kawchar".obs;
  var isUpper=false.obs;
  var age = 24.obs;
  var count=0.obs;

  void increment(){
    count++;
  }

  void changeText(){
    if(name.contains("kawchar")){
      isUpper(true);
      name.value=name.value.toUpperCase();
    }else{
      isUpper(false);
      name.value=name.value.toLowerCase();
    }
  }
}