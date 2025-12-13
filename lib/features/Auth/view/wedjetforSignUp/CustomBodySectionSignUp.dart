import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';
import 'package:flutter_application_12/core/utils/style.dart';
import 'package:flutter_application_12/core/wedjet/CustomButtom.dart';
import 'package:flutter_application_12/core/wedjet/CustomTextField.dart';
import 'package:flutter_application_12/features/Auth/controller/SignUpcubit/sign_up_cubit.dart';
import 'package:flutter_application_12/features/Auth/controller/SignUpcubit/sign_up_state.dart';
import 'package:flutter_application_12/features/Auth/view/wedjetforLogin/CustomDisappearAndAppearIcon.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class BodySectionSignup extends StatefulWidget {
  const BodySectionSignup({super.key});

  @override
  State<BodySectionSignup> createState() => _BodySectionSignupState();
}

class _BodySectionSignupState extends State<BodySectionSignup> {
  bool _passwordVisible = false;
  // bool _confirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // confirmPasswordController.dispose();
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
              controller: nameController,
              // validator: validateUsername,
              hint: 'Your Full Name',
              background: Colors.white,
              keyboardType: TextInputType.emailAddress,
              prefix: const Icon(
                Icons.person_2_outlined,
                color: Color.fromARGB(255, 13, 12, 12),
              ),
            ),
            const SizedBox(height: 16),

            AppTextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              // validator: validateEmail,
              hint: 'Email',
              background: Colors.white,

              prefix: const Icon(
                Icons.email_outlined,
                color: Color.fromARGB(255, 13, 12, 12),
              ),
            ),
            const SizedBox(height: 16),

            AppTextField(
              controller: passwordController,
              // validator: validatePassword,
              hint: 'Password',
              background: Colors.white,
              keyboardType: TextInputType.emailAddress,
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
          
            // AppTextField(
            //   // controller: confirmPasswordController,
            //   validator: (value) =>
            //       validateConfirmPassword(value, passwordController.text),
            //   hint: 'تأكيد كلمة السر ',
            //   background: Colors.white,
            //   keyboardType: TextInputType.emailAddress,
            //   obscure: !_confirmPasswordVisible,
            //   prefix: const Icon(
            //     Icons.lock_outline_rounded,
            //     color: Color.fromARGB(255, 13, 12, 12),
            //   ),
            //   suffix: PasswordVisibilityIcon(
            //     visible: _confirmPasswordVisible,
            //     onPressed: () {
            //       setState(() {
            //         _confirmPasswordVisible = !_confirmPasswordVisible;
            //       });
            //     },
            //   ),
            // ),

            const SizedBox(height: 40),
            BlocListener<SignupCubit, signupState>(
              listener: (context, state) {
                // if (state is signupSuccess) {
                //   context.go(AppRouter.kOTPView);
                // }
                if (state is signupFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
              },
              child: AppButton(
                text: " Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().fetchDataSignup(
                      fullName: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      // confirmPassword: confirmPasswordController.text.trim(),
                    );
                  }
                },
              ),
            ),

 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you have acount ? ", style:Styles.caption),
                GestureDetector(
                  onTap: () {
                    context.go(AppRouter.Loginpage);
                  },
                  child: Text(
                    'go to login' ,
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
