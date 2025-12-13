import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/wedjet/CustomAppBar.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    
     
      CustomAppBar(
      title: 'Open New Account',
           subtitle: 'Select the account type that best fits your needs. You can create more accounts later,',
           bottomPadding: 10,
        
      );
  }
}