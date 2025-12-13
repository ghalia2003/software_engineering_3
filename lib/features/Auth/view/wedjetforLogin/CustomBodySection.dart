import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';
import 'package:flutter_application_12/core/utils/style.dart';

import 'package:flutter_application_12/core/wedjet/CustomButtom.dart';
import 'package:flutter_application_12/core/wedjet/CustomTextField.dart';

import 'package:flutter_application_12/features/Auth/controller/logincubit/login_cubit.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetforLogin/CustomDisappearAndAppearIcon.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class bodysection extends StatefulWidget {
  const bodysection({super.key});

  @override
  State<bodysection> createState() => _bodysectionState();
}

class _bodysectionState extends State<bodysection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),

            AppTextField(
              controller: emailController,
              // validator: validateEmail,
              hint: 'Email',
              background: Colors.white,
              keyboardType: TextInputType.emailAddress,
              prefix: const Icon(
                Icons.mail_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12),
              ),
            ),

            const SizedBox(height: 16),

            AppTextField(
              hint: 'Password' ,
              controller: passwordController,
              // validator: validatePassword,
              background: Colors.white,
              obscure: !_passwordVisible,
              prefix: const Icon(
                Icons.lock_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12),
              ),
              suffix: PasswordVisibilityIcon(
                visible: _passwordVisible,
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),

            const SizedBox(height: 40),

            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) async {
                if (state is loginFailure) {
                  final msg = state.errMessage;

                  // حالة الإيميل غير مفعّل
                  if (msg.contains('Email not verified')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'البريد غير مفعّل، يرجى إدخال رمز التحقق',
                        ),
                      ),
                    );

                    // ننتقل لشاشة OTP ونرسل معها الإيميل
                    // context.go(
                    //   // AppRouter.kOTPView, // مسار شاشة OTP
                    //   extra: emailController.text.trim(),
                    // );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errMessage),
                        backgroundColor: Colors.grey,
                      ),
                    );
    
                  }
                }

                if (state is loginSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  print('hiiiiiiii');
                  // GoRouter.of(context).push(AppRouter.homePage);
                }
              },
               builder: (context, state) {
                if (state is loginLoading) {
                   return const Center(child: CircularProgressIndicator());
                 }

                return AppButton(
                  text: 
                       "Sign in",
                  onPressed: 
                      
                       () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().fetchdatalogin(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you didnt have acount ? ", style:Styles.caption),
                GestureDetector(
                  onTap: () {
                    context.go(AppRouter.signuppage);
                  },
                  child: Text(
                    'go to sign up' ,
                    style:Styles.bodyText.copyWith(color: ColorsTheme.primaryBlue,) 
                  ),
                ),
              ],
            ),
             
         
           
          ],
        ),
      ),
    );
  }
}
