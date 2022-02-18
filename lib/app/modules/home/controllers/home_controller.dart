import 'package:get/get.dart';
import 'package:interview_test_projects/app/local_data_saver/local_data_save.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repo/dio_client.dart';

class HomeController extends GetxController {
  final prefs = SharedPreferences.getInstance();

  var nameUser;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameUser = prefs.getString('name')!;
    DioClient().getUserData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
