import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetgorOtp/CustomBodyOtp.dart';



class OTPscreen extends StatelessWidget {
  const OTPscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: customauthbodyOtp(),
    );
  }
}
