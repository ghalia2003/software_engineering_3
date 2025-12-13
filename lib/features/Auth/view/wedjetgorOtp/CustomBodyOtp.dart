import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/wedjet/CUstomHeader.dart';
import 'package:flutter_application_12/core/wedjet/CustomAppBar.dart';

import 'package:flutter_application_12/features/Auth/view/wedjetgorOtp/CustomBodySectionOtp.dart';

import 'package:go_router/go_router.dart';

class customauthbodyOtp extends StatelessWidget {
  const customauthbodyOtp({super.key});




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
     
              title: 'Verify Your Email',
              subtitle:
"Check your email for the verification code and enter the 6-digit code to continue",
            ),

            BodySectionOtp(),
          ],
        ),
      ),
    );
  }
}
