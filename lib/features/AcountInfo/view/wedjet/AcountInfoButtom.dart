import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/wedjet/CustomButtom.dart';
class AcountInfoButoom extends StatefulWidget {

  const AcountInfoButoom({super.key,});

  @override
  State<AcountInfoButoom> createState() => _AcountInfoButoomState();
}

class _AcountInfoButoomState extends State<AcountInfoButoom> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return                          
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      onChanged: (val) {
                        setState(() => agreed = val!);
                      },
                    ),
                    const Text("I agree to the terms."),
                  ],),
     
    
    
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           child: SizedBox(
                width: double.infinity,
                child:
                AppButton(
                  text: 'Next',
               onPressed: agreed ? () {
    print("Next...");
  } : null,



                ),
 
              ),
         ),
                     ],
            );
         
  }
}