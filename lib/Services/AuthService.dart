// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:MartCart/Constants/error_handling.dart';
import 'package:MartCart/Providers/user_provider.dart';
import 'package:MartCart/Screens/homeScreen.dart';
import 'package:MartCart/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/_Globals.dart';
import '../Models/Users.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // ignore: non_constant_identifier_names
  void SignUpUser({
    // ignore: non_constant_identifier_names
    required BuildContext Context,
    // ignore: non_constant_identifier_names
    required String Name,
    // ignore: non_constant_identifier_names
    required String Email,
    // ignore: non_constant_identifier_names
    required String Password,
  }) async {
    try {
      Users user = Users(
        id: '',
        name: Name,
        email: Email,
        password: Password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log((res.statusCode).toString());
      error_handling(
        res: res,
        context: Context,
        onSuccess: () {
          showError(Context, "Account Created...");
        },
      );
    } catch (e) {
      showError(Context, e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  void SignInUser({
    // ignore: non_constant_identifier_names
    required BuildContext Context,
    // ignore: non_constant_identifier_names
    required String Email,
    // ignore: non_constant_identifier_names
    required String Password,
  }) async {
    try {
      log("try started");
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'Email': Email,
          'Password': Password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log((res.statusCode).toString());
      error_handling(
        res: res,
        context: Context,
        onSuccess: () async {
          log("done");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(Context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['jsonwebtoken']);
          log("Logged In");
          Navigator.pushNamedAndRemoveUntil(
            Context,
            HomeScreen.routName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showError(Context, e.toString());
    }
  }
}
