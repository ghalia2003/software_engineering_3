import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';
import 'package:flutter_application_12/core/wedjet/CustomButtom.dart';
import 'package:flutter_application_12/core/wedjet/CustomTextField.dart';
import 'package:flutter_application_12/features/ticket/controller/cubit/ticket_cubit.dart';
import 'package:flutter_application_12/features/ticket/controller/cubit/ticket_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketBody extends StatefulWidget {
  const TicketBody({super.key});

  @override
  State<TicketBody> createState() => _TicketBodyState();
}

class _TicketBodyState extends State<TicketBody> {
    final _formKey = GlobalKey<FormState>();
  final _subjectCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  @override
  void dispose() {
    _subjectCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<CreateTicketCubit, CreateTicketState>(
    listener: (context, state) {
      if (state is CreateTicketSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
        _subjectCtrl.clear();
        _descCtrl.clear();
      } else if (state is CreateTicketFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      }
    },
    builder: (context, state) {
      final isLoading = state is CreateTicketLoading;

      return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
       
                  Text('Subject of problem', style: Styles.headingMedium),
                  const SizedBox(height: 8),
AppTextField(
  hint: 'Subject',
  background: Colors.white,
  controller: _subjectCtrl,
  keyboardType: TextInputType.text,
  textInputAction: TextInputAction.next,
   borderRadius: BorderRadius.zero, 

),


                  const SizedBox(height: 16),

                  Text('Describtion', style: Styles.headingMedium),
                  const SizedBox(height: 8),
  AppTextField(
  hint: 'Describe your issue...',
  background: Colors.white,
  controller: _descCtrl,
  keyboardType: TextInputType.multiline,
  minLines: 4,
  maxLines: 6,
  textInputAction: TextInputAction.newline,
     borderRadius: BorderRadius.zero, 

),

                  const SizedBox(height: 24),
            AppButton(
                text: isLoading ? "Sending..." : "Send",
                onPressed: isLoading
                    ? null
                    : () {
                      
                          context.read<CreateTicketCubit>().submitTicket(
                                subject: _subjectCtrl.text.trim(),
                                description: _descCtrl.text.trim(),
                              );
               
                    
                  
                },
              ),
     
                ],
              ),
            ),
      );}   
          );
  

  }
}