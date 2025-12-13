import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';
import 'package:flutter_application_12/core/utils/style.dart';



class AppButton extends StatelessWidget {
  final String text; // نص الزر
  final VoidCallback? onPressed; // حدث الضغطة
  final TextStyle? textStyle; // ستايل النص
  final double height; // ارتفاع الزر
  final EdgeInsetsGeometry padding;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
   this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.textStyle = Styles.bodyText,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
           width: double.infinity,
        child: ElevatedButton(
          
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
         backgroundColor: ColorsTheme.primaryBlue,
            shape: const StadiumBorder(),
            elevation: 2,
          ),
          child: Text(text, style:Styles.whiteText),
        ),
      ),
    );
  }
}
