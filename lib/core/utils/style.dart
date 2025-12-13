import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';


abstract class Styles {
  // ✅ عنوان رئيسي (اسم الصفحة – Dashboard – الرصيد)
  static const TextStyle headingLarge = TextStyle(
    fontSize: 26,
      fontFamily: 'Afacad',
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
    color: ColorsTheme.primaryBlue,
  );

  // ✅ عنوان ثانوي (عناوين الأقسام)
  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
      fontFamily: 'Afacad',
    fontWeight: FontWeight.bold,
    color: ColorsTheme.textDark,
  );

  // ✅ نص عادي أساسي (الوصف – التفاصيل)
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
      fontFamily: 'Afacad',
    fontWeight: FontWeight.normal,
    color: ColorsTheme.textGrey,
  );

  // ✅ نص صغير (ملاحظات – تاريخ – وقت)
  static const TextStyle caption = TextStyle(
    fontSize: 14,
      fontFamily: 'Afacad',
    fontWeight: FontWeight.normal,
    color: ColorsTheme.textGrey,
  );

  // ✅ نص مائل (تنبيه خفيف – ملاحظة)
  static const TextStyle italicNote = TextStyle(
    fontSize: 16,
      fontFamily: 'Afacad',
    fontWeight: FontWeight.w200,
    fontStyle: FontStyle.italic,
    color: ColorsTheme.warningOrange,
  );

  // ✅ نص أبيض (للأزرار – AppBar)
  static const TextStyle whiteText = TextStyle(
    fontSize: 16,
  fontFamily: 'ArialRounded',
    color: ColorsTheme.cardWhite,
    fontWeight: FontWeight.w500,
  );

  // ✅ نص أسود ثقيل (أرقام، رصيد، مبالغ)
  static const TextStyle blackBold = TextStyle(
    fontSize: 18,
      fontFamily: 'Afacad',
    color: ColorsTheme.textDark,
    fontWeight: FontWeight.bold,
  );

  // ✅ نص نجاح (عملية تمت)
  static const TextStyle successText = TextStyle(
    fontSize: 16,
      fontFamily: 'Afacad',
    color: ColorsTheme.successGreen,
    fontWeight: FontWeight.bold,
  );

  // ✅ نص خطأ (عملية فشلت)
  static const TextStyle errorText = TextStyle(
    fontSize: 16,
      fontFamily: 'Afacad',
    color: ColorsTheme.errorRed,
    fontWeight: FontWeight.bold,
  );
}

// ✅ ستايل افتراضي عام
const TextStyle textStyle = TextStyle();
