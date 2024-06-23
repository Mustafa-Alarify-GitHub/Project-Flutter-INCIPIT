import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled2/Home.dart';
import 'package:untitled2/sqlDB+ALL.dart';

import '../Account_Clinet.dart';

class Update_Clinet_Controller extends GetxController {
  sqlDb sql = sqlDb();
  TextEditingController nameer = TextEditingController();



  Update_Data_clinet(id)async{
    if (nameer.text == "") {
      Get.snackbar("تنبيه", "أدخل البيانات بشكل صحيح..",
          backgroundColor: const Color.fromRGBO(237, 125, 49, .7),
          snackPosition: SnackPosition.TOP);
      print("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
      print(id);
      print("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
    } else {
      var ruslt = await sql.updata_plus("category", {
        "name": nameer.text,
      },"id = $id");


      if (ruslt > 0) {

        Get.offAll(() => Home(), transition: Transition.size);


      }
    }
  }
}
