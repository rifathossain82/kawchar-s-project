import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawchar_project/src/controller/studentController.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);

  final studentController=Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Name'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx((){
              return Text(studentController.name.value, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blue),);
            }),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  studentController.changeText();
                },
                child: Obx((){
                  return Text(studentController.isUpper.value? "Lower" : "Upper");
                }),
            ),
          ],
        ),
      ),
    );
  }
}
