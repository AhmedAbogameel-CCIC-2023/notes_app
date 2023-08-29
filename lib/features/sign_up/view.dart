import 'package:flutter/material.dart';
import 'package:note_app/core/app_colors/app_colors.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/core/route_utils/route_utils.dart';
import 'package:note_app/widgets/app_app_bar.dart';
import 'package:note_app/widgets/app_button.dart';
import 'package:note_app/widgets/app_text.dart';
import 'package:note_app/widgets/app_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        enableBackButton: true,
      ),
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
          SizedBox(height: 40.height),
          AppText(
            title: "Sign up",
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 48.height),
          AppTextField(
            hint: 'Name',
          ),
          Divider(height: 20, color: AppColors.gray),
          AppTextField(
            hint: 'Email',
          ),
          Divider(height: 20, color: AppColors.gray),
          AppTextField(
            hint: 'Password',
          ),
          SizedBox(height: 64.height),
          AppButton(
            title: 'Sign up',
            onTap: () {},
          ),
          SizedBox(height: 48.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title: 'Do you have an account?',
                color: AppColors.gray,
              ),
              SizedBox(width: 4.width),
              AppText(
                title: 'Login',
                textDecoration: TextDecoration.underline,
                onTap: () => RouteUtils.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
