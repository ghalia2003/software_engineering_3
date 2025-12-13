import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetgorOtp/CustomSucssessOtp.dart';



class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      body: customsuccessotp(),
    );
  }
}
