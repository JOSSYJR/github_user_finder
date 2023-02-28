import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:github_user_finder/controllers/base_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  final bool readonly;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final borderRadius = 15.0;
  final base = Get.find<BaseController>();

  SearchBar({
    Key? key,
    this.readonly = true,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: base.searchController,
      style: GoogleFonts.spaceMono(
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: () {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: SvgPicture.asset('assets/images/icon-search.svg'),
          ),
          suffixIcon: FilledButton(
            onPressed: () {
              base.search();
            },
            child: Text(
              'Search',
              style: GoogleFonts.spaceMono(fontWeight: FontWeight.normal),
            ),
          ),
          hintStyle: GoogleFonts.spaceMono(
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          hintText: "Search Github username",
          //fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
    );
  }
}
