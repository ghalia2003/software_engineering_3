import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/LoanPage/design/loan_strategy_factor.dart';


enum LoanAccountType { main, sub }

class LoanFormPage extends StatefulWidget {
  const LoanFormPage({super.key});

  @override
  State<LoanFormPage> createState() => _LoanFormPageState();
}

class _LoanFormPageState extends State<LoanFormPage> {
  LoanAccountType _selectedType = LoanAccountType.main;

  final TextEditingController accountIdController = TextEditingController();
  final TextEditingController subAccountIdController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController monthlyInstallmentController =
      TextEditingController();
  final TextEditingController durationMonthsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Loan Form'),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'نوع القرض',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            RadioListTile<LoanAccountType>(
              title: const Text('حساب رئيسي'),
              value: LoanAccountType.main,
              groupValue: _selectedType,
              onChanged: (value) {
                setState(() => _selectedType = value!);
              },
            ),
            RadioListTile<LoanAccountType>(
              title: const Text('حساب فرعي'),
              value: LoanAccountType.sub,
              groupValue: _selectedType,
              onChanged: (value) {
                setState(() => _selectedType = value!);
              },
            ),

            const SizedBox(height: 16),

            if (_selectedType == LoanAccountType.main)
              TextField(
                controller: accountIdController,
                decoration: const InputDecoration(
                  labelText: 'AccountId',
                  border: OutlineInputBorder(),
                ),
              )
            else
              TextField(
                controller: subAccountIdController,
                decoration: const InputDecoration(
                  labelText: 'SubAccountId',
                  border: OutlineInputBorder(),
                ),
              ),

            const SizedBox(height: 16),

            TextField(
              controller: totalAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total Amount',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: monthlyInstallmentController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Monthly Installment',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: durationMonthsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Duration Months',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                final strategy =
                    LoanStrategyFactory.create(_selectedType);

                final data = strategy.buildLoanData(
                  totalAmount: totalAmountController.text,
                  monthlyInstallment:
                      monthlyInstallmentController.text,
                  durationMonths:
                      durationMonthsController.text,
                  accountId: accountIdController.text,
                  subAccountId:
                      subAccountIdController.text,
                );

                debugPrint(data.toString());
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}