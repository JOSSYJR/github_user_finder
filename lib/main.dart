import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user_finder/component/appbar_component.dart';
import 'package:github_user_finder/component/result_component.dart';
import 'package:github_user_finder/theme.dart';

import 'component/searchbar_component.dart';
import 'controllers/base_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final base = Get.put(BaseController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'devfinder',
      darkTheme: AppTheme.darkTheme(),
      theme: AppTheme.lightTheme(),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              //backgroundColor: Theme.of(context).colorScheme.onSurface,
              expandedHeight: 130,
              stretch: true,
              title: const CustomAppbar(),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  child: SearchBar(),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(child: ResultComponent()),
      ),
    );
  }
}


