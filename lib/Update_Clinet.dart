import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/Add_New_Clinet_Controller.dart';
import 'package:untitled2/Home.dart';
import 'package:untitled2/widget/Text_Filed.dart';

import 'Controllers/Update_Client_Controllers.dart';

class Update_Clinet extends StatelessWidget {


 late int id;
  final String cat;


  @override
  Color co1 = Color.fromRGBO(239, 89, 41, 1);


  Update_Clinet({super.key, required this.id, required this.cat,});



 Update_Clinet_Controller _controoler=Get.put(Update_Clinet_Controller());
  @override
  Widget build(BuildContext context) {
    _controoler.nameer.text=this.cat;

    return SafeArea(
      child: Scaffold(
        body:  Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            blurRadius: 10)
                      ]),
                  child: Center(
                    child: Image.asset(
                      "Assets/logo.jpg",
                      width: 200,
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "أضافه خدمه جديده",
                      style: TextStyle(
                          fontSize: 40, color: co1, fontFamily: "Cairo"),
                    )),
                Text_Flied(
                    controller_: _controoler.nameer,
                    keyboardType_: TextInputType.name,
                    labelText: "اسم الملف",
                    maxLines: 1),

                InkWell(
                  onTap: (){
                    _controoler.Update_Data_clinet(this.id);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: co1,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ]),
                    child: const Center(
                      child: Text(
                        "أضافه",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Cairo"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );

  }
}
