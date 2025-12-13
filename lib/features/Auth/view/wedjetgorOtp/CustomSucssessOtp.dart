import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';
import 'package:flutter_application_12/core/wedjet/CUstomHeader.dart';
import 'package:flutter_application_12/core/wedjet/CustomButtom.dart';

import 'package:go_router/go_router.dart';


class customsuccessotp extends StatelessWidget {
  const customsuccessotp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Icon(Icons.check_circle, color: ColorsTheme.primaryBlue, size: 120),

            CustomHeader(
              title: "Verification Successful",
              subtitle:
                  "Your email has been successfully verified. You can now log in to your account.",
              topPadding: 30,
            ),
            const SizedBox(height: 10),
            AppButton(
              text: "Continue ",
              onPressed: () {
                context.go(AppRouter.Loginpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
