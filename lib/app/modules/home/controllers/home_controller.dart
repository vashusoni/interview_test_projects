import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repo/dio_client.dart';
import 'package:stream/stream.dart';

class HomeController extends GetxController {


  ///The stream has been used to show the selected user's data in realtime.
  final StreamController streamController = StreamController();


  ///The method is being used to add the select user to the app bar.
   void addSelectedUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var name= prefs.getString('user');
    streamController.add(name);
  }


  ///The addSelectedUser is called in onInit to display the user's data at the
  ///start of the app.
  @override
  void onInit() async {
    addSelectedUser();
    super.onInit();
  }

  ///To save user data in the local database, the setUser method is used for
  Future<bool> setUserData(var userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', userDetails);
  }


  ///The getmethod is used to get the saved user data (in the local database)
  Future<String?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('user');
  }


}
