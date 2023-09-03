import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/login/states.dart';

import '../../core/caching_utils/caching_utils.dart';
import '../../core/network_utils/network_utils.dart';
import '../../core/route_utils/route_utils.dart';
import '../../widgets/snack_bar.dart';
import '../home/view.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  final formKey = GlobalKey<FormState>();
  String? email, password;

  Future<void> login(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoading());
    try {
      final response = await NetworkUtils.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      await CachingUtils.cacheUser(response.data);
      RouteUtils.pushAndPopAll(
        context: context,
        view: HomeView(),
      );
    } on DioException catch (e) {
      showSnackBar(
        context,
        title: e.response?.data['message'] ?? '',
        error: true,
      );
    }
    emit(LoginInit());
  }

}