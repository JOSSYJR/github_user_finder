

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:github_user_finder/model/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/base_controller.dart';

class ResultComponent extends StatelessWidget {
  ResultComponent({Key? key}) : super(key: key);
  final base = Get.find<BaseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => base.users.isEmpty ? const Center(child: Text('No user found'),) : UserItem(user: base.users.first));
  }
}

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image(image: NetworkImage(user.avatarUrl??""),
                  height: 80,
                  width: 80,
                )
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${user.name ?? user.login}",style: GoogleFonts.spaceMono(fontSize: 18),),
                  SizedBox(width: 60,),
                  Text("Joined ${DateFormat('d MMM yyyy').format(DateTime.parse(user.createdAt.toString()))}",style: GoogleFonts.spaceMono(fontSize: 9,color: Theme.of(context).colorScheme.secondary),),
                ],
              ),
              const SizedBox(height: 5,),
              Text("@${user.login}",style: GoogleFonts.spaceMono(fontSize: 12,color: Theme.of(context).colorScheme.secondary),),

              const SizedBox(height: 15,),
              Text(user.bio?? "This profile has no bio",style: GoogleFonts.spaceMono(fontSize: 12,color: Theme.of(context).colorScheme.secondary),),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopDownText(title: "Repos",value: "${user.publicRepos}"),
                    TopDownText(title: "Followers",value: "${user.followers}"),
                    TopDownText(title: "Following",value: "${user.following}"),
                  ],
                ),
              ),

              const SizedBox(height: 20,),


              Wrap(
                children: [
                  BottomComponent(text: "${user.location}", svgPath: 'assets/images/icon-location.svg'),
                  BottomComponent(text: "${user.twitterUsername}", svgPath: 'assets/images/icon-twitter.svg'),
                ],
              ),

              Wrap(
                children: [
                  BottomComponent(text: "${user.blog}", svgPath: 'assets/images/icon-website.svg'),
                  BottomComponent(text: "${user.company}", svgPath: 'assets/images/icon-company.svg')
                ],
              )


            ],
          ),
        ],
      )
    );
  }
}


class TopDownText extends StatelessWidget {
  const TopDownText({Key? key,required this.title,required this.value}) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(title,style: GoogleFonts.spaceMono(fontSize: 12,fontWeight: FontWeight.bold),),
          Text(value,style: GoogleFonts.spaceMono(fontSize: 30,color: Theme.of(context).colorScheme.secondary),),
        ],
      ),
    );
  }
}


class BottomComponent extends StatelessWidget {
  const BottomComponent({Key? key,required this.text,required this.svgPath}) : super(key: key);
  final String text,svgPath;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Wrap(
          children: [
            SvgPicture.asset(svgPath),
            const SizedBox(width: 5),
            Text(text == "null" ? "Not Available" : text,overflow: TextOverflow.ellipsis,style: GoogleFonts.spaceMono(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}


