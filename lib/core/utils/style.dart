import 'package:flutter/material.dart';
import 'package:software_engineering_3/core/utils/colors_theme.dart';

abstract class Styles {
  // ✅ عنوان رئيسي (اسم الصفحة – Dashboard – الرصيد)
  static const TextStyle headingLarge = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
    color: ColorsTheme.primaryBlue,
  );

  // ✅ عنوان ثانوي (عناوين الأقسام)
  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.textDark,
  );

  // ✅ نص عادي أساسي (الوصف – التفاصيل)
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ColorsTheme.textGrey,
  );

  // ✅ نص صغير (ملاحظات – تاريخ – وقت)
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorsTheme.textGrey,
  );

  // ✅ نص مائل (تنبيه خفيف – ملاحظة)
  static const TextStyle italicNote = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    fontStyle: FontStyle.italic,
    color: ColorsTheme.warningOrange,
  );

  // ✅ نص أبيض (للأزرار – AppBar)
  static const TextStyle whiteText = TextStyle(
    fontSize: 16,
    color: ColorsTheme.cardWhite,
    fontWeight: FontWeight.w500,
  );

  // ✅ نص أسود ثقيل (أرقام، رصيد، مبالغ)
  static const TextStyle blackBold = TextStyle(
    fontSize: 18,
    color: ColorsTheme.textDark,
    fontWeight: FontWeight.bold,
  );

  // ✅ نص نجاح (عملية تمت)
  static const TextStyle successText = TextStyle(
    fontSize: 16,
    color: ColorsTheme.successGreen,
    fontWeight: FontWeight.bold,
  );

  // ✅ نص خطأ (عملية فشلت)
  static const TextStyle errorText = TextStyle(
    fontSize: 16,
    color: ColorsTheme.errorRed,
    fontWeight: FontWeight.bold,
  );
}

// ✅ ستايل افتراضي عام
const TextStyle textStyle = TextStyle();
