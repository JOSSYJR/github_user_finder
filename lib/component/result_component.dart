

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user_finder/model/user.dart';

import '../controllers/base_controller.dart';

class ResultComponent extends StatelessWidget {
  ResultComponent({Key? key}) : super(key: key);
  final base = Get.find<BaseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children:[
        ...base.users.map((e) => UserItem(user: e,)).toList(),
        if(base.users.isEmpty)
          const Center(child: Text('No user found'),)
      ],
    ));
    return Container();
  }
}

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      width: double.infinity,
    );
  }
}

