// import 'package:flutter/material.dart';
// import 'package:flutter_application_12/core/utils/style.dart';



// class AppTextField extends StatelessWidget {
//   final String hint;
//   final bool obscure;
//   final Widget? suffix;
//   final Widget? prefix;
//   final Color background; //لون خلفية الادخال
//   final TextInputType? keyboardType;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   const AppTextField({
//     required this.hint,
//     required this.background,
//     this.obscure = false,
//     this.suffix,
//     this.prefix,
//     this.keyboardType,
//     this.controller,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       obscureText: obscure,
//       controller: controller, //هو متغير بولياني من اجل اخفاء كلمة السر او لا
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: Styles.caption.copyWith(
//           color: Color.fromARGB(255, 13, 12, 12),
//         ),
//         filled: true,
//         fillColor: background,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 18,
//         ), //هذه المسافة داخل الحقل حول النص.
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(40),
//           borderSide: BorderSide.none, //حدود خارجية
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(
//             color: Color.fromARGB(255, 34, 30, 30),
//             width: 1.2, //السمك 1.2
//           ),
//         ),

//         suffixIcon: suffix,
//         prefixIcon: prefix,
//       ),
//       style: const TextStyle(
//         //ستايل النص الذي يكتبه المستخدم:
//         fontSize: 15,
//         color: Color(0xFF3A3F47),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Widget? suffix;
  final Widget? prefix;
  final Color background;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final int minLines;
  final int maxLines;
  final TextInputAction? textInputAction;

  /// التحكم في شكل الحواف (دائري / مستقيم)
  final BorderRadius? borderRadius;

  const AppTextField({
    super.key,
    required this.hint,
    required this.background,
    this.obscure = false,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.controller,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputAction,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
        borderRadius ?? BorderRadius.circular(40); // default = login

    return TextFormField(
      validator: validator,
      obscureText: obscure,
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Styles.caption.copyWith(
          color: const Color.fromARGB(255, 13, 12, 12),
        ),
        filled: true,
        fillColor: background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        // ✅ الحواف في الوضع العادي
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(
            color: Color(0xFFB0B0B0), // رمادي خفيف
            width: 1,
          ),
        ),

        // ✅ الحواف عند التركيز
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 34, 30, 30),
            width: 1.5,
          ),
        ),

        // ✅ الحواف عند الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),

        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xFF3A3F47),
      ),
    );
  }
}
