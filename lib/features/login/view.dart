import 'package:flutter/material.dart';
import 'package:note_app/core/app_colors/app_colors.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/core/route_utils/route_utils.dart';
import 'package:note_app/widgets/app_app_bar.dart';
import 'package:note_app/widgets/app_button.dart';
import 'package:note_app/widgets/app_text.dart';
import 'package:note_app/widgets/app_text_field.dart';

import '../sign_up/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 32.height),
          AppText(
            title: "Notes App",
            textAlign: TextAlign.center,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 48.height),
          AppText(
            title: "Login",
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 64.height),
          AppTextField(
            hint: 'Email',
          ),
          Divider(height: 20, color: AppColors.gray),
          AppTextField(
            hint: 'Password',
          ),
          SizedBox(height: 64.height),
          AppButton(
            title: 'Login',
            onTap: () {},
          ),
          SizedBox(height: 48.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title: 'Do not have an account?',
                color: AppColors.gray,
              ),
              SizedBox(width: 4.width),
              AppText(
                title: 'Sign up',
                textDecoration: TextDecoration.underline,
                onTap: () => RouteUtils.push(
                  context: context,
                  view: SignUpView(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
