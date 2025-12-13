import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/wedjet/CUstomHeader.dart';

import 'package:flutter_application_12/features/Auth/view/wedjetforLogin/CustomBodySection.dart';



class customauthbodyLogin extends StatelessWidget {
  const customauthbodyLogin({super.key});


  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(


          children: [

              CustomHeader(
              topPadding: 100,
              title: 'Login to Your  Acount',
              subtitle:
               "Enter your password and email to ensure the privacy of your data and to log in securely."
            ),
            bodysection(),
          ],
        ),
      ),
    );
  }
}
