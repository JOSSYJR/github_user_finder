

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('devfinder',
            style: GoogleFonts.spaceMono(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        InkWell(
          onTap: (){
            Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            //Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
          child: SvgPicture.asset(
              'assets/images/icon-moon.svg',
              semanticsLabel: 'Dark Logo'
          ),
        )
      ],
    );
  }
}
