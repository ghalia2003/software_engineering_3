import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';
import 'package:flutter_application_12/features/AcountInfo/model/AcountInfoModel.dart';
class AcountInfoText extends StatefulWidget {
  final AccountType acc;     // 👈 البيانات تأتي من الشاشة السابقة

  const AcountInfoText({super.key, required this.acc});

  @override
  State<AcountInfoText> createState() => _AcountInfoTextState();
}

class _AcountInfoTextState extends State<AcountInfoText> {


  @override
  Widget build(BuildContext context) {
final acc = widget.acc;  

    return   Padding(
     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  acc.name,
                  style:Styles.headingLarge.copyWith(color:Colors.black,fontWeight:FontWeight.bold)
                
                ),
                    
                  
            const SizedBox(height: 8),
                  
            Text(
              acc.subtitle,
              style:Styles.bodyText,
                     
            ),
                  
            const SizedBox(height: 16),
                  
            Text("Interest Rate: ${acc.interestRate}%"),
            Text("Daily Withdraw Limit: ${acc.withdrawLimit}"),
            Text("Daily Deposit Limit: ${acc.depositLimit}"),
            Text("Monthly Fee: \$${acc.monthlyFee}"),
                  
            const SizedBox(height: 20),
                  
            const Text(
              "Terms & Conditions:",
              style:Styles.headingMedium,
              //  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
                  
            const SizedBox(height: 10),
                  
                   
             Text(
                  acc.terms,
                  style: const TextStyle(fontSize: 16),
                ),
              
            

            ],
            ),);
  }
}