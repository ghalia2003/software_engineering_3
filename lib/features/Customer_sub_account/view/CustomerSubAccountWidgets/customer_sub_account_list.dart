import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/sub_account_cubit.dart';
import '../../controller/sub_account_state.dart';
import '../../model/account_component.dart';
import '../../model/sub_account_leaf.dart';

class CustomerSubAccountList extends StatelessWidget {
  const CustomerSubAccountList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubAccountCubit, SubAccountState>(
      builder: (context, state) {
        if (state is SubAccountLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SubAccountFailure) {
          return Center(child: Text(state.errorMessage, style: Styles.errorText));
        }

        if (state is SubAccountSuccess) {
          final accounts = state.accounts;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final AccountComponent parent = accounts[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  title: Text(parent.title, style: Styles.headingMedium),
  subtitle: parent.balance != null
      ? Text(
          "Balance: ${parent.balance!.toStringAsFixed(2)}",
          style: Styles.caption,
        )
      : null,
                  children: parent.children.map((child) {
                    final sub = child as SubAccountLeaf;

                    return ListTile(
                      title: Text(sub.title, style: Styles.bodyText),
                      subtitle: Text(
                        "Balance: ${sub.balance?.toStringAsFixed(2)} | DailyLimit: ${sub.dailyWithdrawalLimit}",
                        style: Styles.caption,
                      ),
                      trailing: Text(sub.statusName, style: Styles.caption),
                    );
                  }).toList(),
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
