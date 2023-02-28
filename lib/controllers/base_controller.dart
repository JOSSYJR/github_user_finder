import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class BaseController extends GetxController {
  final String path = 'https://api.github.com/users/';
  final searchController = TextEditingController();
  RxList<User> users = <User>[].obs;
  final Dio _dio = Dio();

  Future<User> getUser({String username = 'o'}) async {
    try{
      final response = await _dio.get(path + username);
      if(response.statusCode == 200){
        print(response.data);
        return User.fromJson(response.data);
      }else{
        Get.snackbar('Error', 'User not found');
        throw Exception('User not found');
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        Get.snackbar('Error', 'User not found');
      }
      rethrow;
    }
  }


  search() async {
    var data = await getUser(username: searchController.text);
    users.clear();
    users.add(data);
  }

  @override
  void onInit() {
    getUser().then((value) => users.add(value));
    super.onInit();
  }
}