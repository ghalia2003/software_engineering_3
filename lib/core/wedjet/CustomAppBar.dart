import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


class CustomAppBar extends StatelessWidget {
  final String? title;     
  final String? subtitle; 
  final double topPadding;
  final double bottomPadding;
  final Icon? icon;
  final VoidCallback? onTap;
  const CustomAppBar({
    this.onTap,
    super.key,
  
     this.subtitle,
    this.topPadding = 10,
    this.bottomPadding = 40,
       this.title,
       this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
           Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20,
        right: 20,
        bottom: bottomPadding,
      ),
      child:  
              GestureDetector(
                       onTap: onTap ?? () {
          
          if (context.canPop()) {
            context.pop();
          }},
                
                
                child: Icon(Icons.arrow_back, size: 30)),
     
     
           ),
        ],
      );
    
  }
}
