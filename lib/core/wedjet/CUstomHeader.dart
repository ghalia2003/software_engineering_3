import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';



class CustomHeader extends StatelessWidget {
  final String title; 
  final String subtitle; 
  final double topPadding;
  final double bottomPadding;

  const CustomHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.topPadding = 90,
    this.bottomPadding = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20,
        right: 20,
        bottom: bottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: Styles.headingLarge),
          const SizedBox(height: 8),
          Text(
            subtitle,
         
            style: Styles.headingMedium,
          ),
        ],
      ),
    );
  }
}
