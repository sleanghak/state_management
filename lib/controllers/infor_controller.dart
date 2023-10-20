// import 'dart:ffi';
// import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  final box = GetStorage();
  List<dynamic> lstDevelopers = [];

  @override
  void onInit() {
    onFetchData();
    super.onInit();
  }

  onSaveData() {
    List lstDp = [];
    lstDp.addAll(lstDevelopers);
    Map<String, dynamic> developer = {
      "name": nameController.text,
      "position": positionController.text,
    };
    // print(nameController.text);
    // print(positionController.text);
    lstDp.add(developer);
    box.write('developer', lstDp);
    // print(box.read('developer'));
    onFetchData();
  }

  onFetchData() async {
    lstDevelopers = await box.read('developer');
    if (lstDevelopers.isEmpty) {
      lstDevelopers = [];
    }
    // print(box.read('developer'));
    print(lstDevelopers);
    update();
  }

  onDeleteData(int index) {
    lstDevelopers.removeAt(index);
    box.write('developer', lstDevelopers);
    // box.remove('developer');
    onFetchData();
  }
}
