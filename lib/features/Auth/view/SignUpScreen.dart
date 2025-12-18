import 'package:flutter/material.dart';

import 'package:flutter_application_12/features/Auth/view/wedjetforSignUp/CustomBodySignUp.dart';



class SignUpscreen extends StatelessWidget {
  const SignUpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(


      body: customauthbodySignUp(),
    );
  }
}
