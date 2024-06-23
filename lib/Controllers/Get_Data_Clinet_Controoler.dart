import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/PDF.dart';
import 'package:untitled2/Update.dart';
import 'package:untitled2/sqlDB+ALL.dart';
import 'package:intl/intl.dart';

import '../Update_Clinet.dart';


class Get_Data_Clinet_Controller extends GetxController {
  sqlDb sql = sqlDb();
  TextEditingController titels = TextEditingController();

  bool lodding = true;
  List data = [];
  List sum_price = [];

  Update_Date(id, servies, price, note,name_cat,id_clint) {
    Get.off(() => Update(id: id, servies: servies, price: price, note: note,cat: name_cat,id_cat: id_clint,));
  }
  
  Get_All_Data(int id_Clinet) async {
    data.clear();
    sum_price.clear();
    lodding = true;
    var ruslt = await sql.select("select * from db where cat = '$id_Clinet'");
    var ruslt2 = await sql.select(
        "select sum(price) as 'sum' from db GROUP BY cat having cat = '$id_Clinet'");
    data.addAll(ruslt);
    sum_price.addAll(ruslt2);
    lodding = false;
    update();
  }


  Delete_Data(id,idcat) async {
    var ruslt = await sql.delete_plus("db", "id = $id");
    print(ruslt);
    if (ruslt > 0) {
      Get_All_Data(idcat);
      Get.back();
    }
  }






  var date_Time = DateTime.now();

  void Date_Picker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value == null) {
        return;
      }
      date_Time = value;
      update();
    });
  }

  Get_BDF(String nameC) async {
    List d = [];
    Get.back();
    var filter_data = "${DateFormat.yMEd().format(date_Time)}";
    var rsult = await sql.select_plus('db');
    var sum = await sql.select("select sum(price) from db ");
    d.addAll(rsult);
    PDF.Get_Data(nameC,titels.text ,filter_data, data, "${sum_price[0]["sum"]}");
    print("rrrrrrrrrrrrrrrr");
    print(sum_price);
    print("rrrrrrrrrrrrrrrr");

    PDF.createPdf();
  }
}