import 'package:flutter/material.dart';

class SignUpController {

  final formKey = GlobalKey<FormState>();
  String? name, email, password;

  Future<void> signUp() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    print({
      "name": name,
      "email": email,
      "password": password,
    });
  }

}