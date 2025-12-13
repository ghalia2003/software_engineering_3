import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/wedjet/CUstomHeader.dart';
import 'package:flutter_application_12/core/wedjet/CustomAppBar.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetforSignUp/CustomBodySectionSignUp.dart';
import 'package:go_router/go_router.dart';

class customauthbodySignUp extends StatelessWidget {
  const customauthbodySignUp({super.key});




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              bottomPadding:2,
                     onTap: () {
                context.go(AppRouter.Loginpage);
              },
            ),
         CustomHeader(
     
              title: 'Creat Your Acount',
              subtitle:
"Create your account by entering your personal information securely.",
            ),

            BodySectionSignup(),
          ],
        ),
      ),
    );
  }
}
