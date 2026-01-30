import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Customer_sub_account/controller/sub_account_cubit.dart';
import 'package:flutter_application_12/features/Customer_sub_account/controller/sub_account_state.dart';
import 'package:flutter_application_12/features/transfer/controller/cubit/transfer_cubit.dart';
import 'package:flutter_application_12/features/transfer/controller/cubit/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final fromCtrl = TextEditingController();
  final toCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تحويل')),

      body: BlocListener<TransferCubit, TransferState>(
        listener: (context, state) {
          if (state is TransferSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.pop(true); // نرجع ونحدّث الحسابات
          }

          if (state is TransferFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },

        child: BlocBuilder<SubAccountCubit, SubAccountState>(
          builder: (context, state) {
            if (state is! SubAccountSuccess) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ✅ From Account ID
                  TextField(
                    controller: fromCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'رقم الحساب المُرسل',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ✅ To Account ID
                  TextField(
                    controller: toCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'رقم الحساب المستلم',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ✅ Amount
                  TextField(
                    controller: amountCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'المبلغ',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('تحويل'),
                      onPressed: () {
                        final fromId = int.tryParse(fromCtrl.text);
                        final toId = int.tryParse(toCtrl.text);
                        final amount = double.tryParse(amountCtrl.text);

                        if (fromId == null || toId == null || amount == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('يرجى إدخال قيم صحيحة'),
                            ),
                          );
                          return;
                        }

                        // 🔍 نحاول نجيب رصيد الحساب المُرسل للتحقق
                        final fromAccount = state.accounts
                            .expand((p) => p.children)
                            .cast<dynamic>()
                            .firstWhere(
                              (a) => a.subAccountId == fromId,
                              orElse: () => null,
                            );

                        context.read<TransferCubit>().submitTransfer(
                              fromAccountNumber: fromId,
                              toAccountNumber: toId,
                              amount: amount,
                              fromBalance:
                                  fromAccount?.balanceValue, // ممكن تكون null
                            );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
