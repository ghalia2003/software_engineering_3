import 'package:flutter/material.dart';

class Static {
  static String ipconfig = "172.20.10.13:10349";
  static String abhayaLibrefont = "AbhayaLibre";
  static String afacadfont = "Afacad";
  static String arialRoundedMTfont = "ArialRoundedMT";

  static double getheight(BuildContext context, double size) {
    return (MediaQuery.of(context).size.height / 932) * size;
  }

  static double getwidth(BuildContext context, double size) {
    return (MediaQuery.of(context).size.width / 430) * size;
  }

  static void showCustomSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
