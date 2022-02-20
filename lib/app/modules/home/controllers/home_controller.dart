import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repo/dio_client.dart';
import 'package:stream/stream.dart';

class HomeController extends GetxController {


  bool isRed=false;
  final StreamController streamController = StreamController();

  addUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var name= prefs.getString('user');
    streamController.add(name);
  }



  @override
  void onInit() async {
    addUser();
    super.onInit();
  }

  Future<bool> setUserData(var userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', userDetails);
  }

  Future<String?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('user');
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
