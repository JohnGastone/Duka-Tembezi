// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_animation/screens/onboarding/components/sign_up_form.dart';

import 'sign_in_form.dart';

void showCustomDialogUp(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 580,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 30),
                blurRadius: 60,
              ),
              const BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 30),
                blurRadius: 60,
              ),
            ],
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 50,
                      // ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Jisajili ili upate huduma kutoka Duka Tembezi, ni rahisi sana.\n \n KARIBU!!",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SignUpForm(),
                      Row(
                        children: const [
                          // Expanded(
                          //   child: Divider(),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16),
                          //   child: Text(
                          //     "OR",
                          //     style: TextStyle(
                          //       color: Colors.black26,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                          // Expanded(child: Divider()),
                        ],
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 24),
                      //   child: Text(
                      //     "Sign up with Email, Apple or Google",
                      //     style: TextStyle(color: Colors.black54),
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       padding: EdgeInsets.zero,
                      //       icon: SvgPicture.asset(
                      //         "assets/icons/email_box.svg",
                      //         height: 64,
                      //         width: 64,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       padding: EdgeInsets.zero,
                      //       icon: SvgPicture.asset(
                      //         "assets/icons/apple_box.svg",
                      //         height: 64,
                      //         width: 64,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       padding: EdgeInsets.zero,
                      //       icon: SvgPicture.asset(
                      //         "assets/icons/google_box.svg",
                      //         height: 64,
                      //         width: 64,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: -150,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}