import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetforLogin/CustomBodyLogin.dart';



// ignore: camel_case_types
class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: customauthbodyLogin(),
    );
  }
}
