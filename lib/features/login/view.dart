import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/app_colors/app_colors.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/core/route_utils/route_utils.dart';
import 'package:note_app/features/login/cubit.dart';
import 'package:note_app/features/login/states.dart';
import 'package:note_app/widgets/app_app_bar.dart';
import 'package:note_app/widgets/app_button.dart';
import 'package:note_app/widgets/app_text.dart';
import 'package:note_app/widgets/app_text_field.dart';

import '../../core/validator_utils/validator_utils.dart';
import '../sign_up/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppAppBar(),
        body: Builder(
          builder: (context) {
            final cubit = BlocProvider.of<LoginCubit>(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
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
                    onSaved: (v) => cubit.email = v,
                    validator: ValidatorUtils.email,
                  ),
                  Divider(height: 20, color: AppColors.gray),
                  AppTextField(
                    hint: 'Password',
                    onSaved: (v) => cubit.password = v,
                    validator: ValidatorUtils.password,
                  ),
                  SizedBox(height: 64.height),
                  BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      return AppButton(
                        title: 'Login',
                        isLoading: state is LoginLoading,
                        onTap: () => cubit.login(context),
                      );
                    },
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
        ),
      ),
    );
  }
}
