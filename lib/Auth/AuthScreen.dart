import 'dart:developer';

import 'package:MartCart/Services/AuthService.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/CommonButton.dart';
import '../CommonWidgets/CommontextField.dart';
import '../Constants/_Globals.dart';

// ignore: camel_case_types
class authScreen extends StatefulWidget {
  const authScreen({super.key});
  static const String routname = 'AuthScreen';
  @override
  State<authScreen> createState() => _authScreenState();
}

enum Auth {
  signin,
  signup,
}

// ignore: camel_case_types
class _authScreenState extends State<authScreen> {
  Auth auth = Auth.signup;
  final _signupkey = GlobalKey<FormState>();
  final _signinkey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _name.dispose();
    _pass.dispose();
  }

  void SignUpUser() {
    authService.SignUpUser(
      Context: context,
      Name: _name.text,
      Email: _email.text,
      Password: _pass.text,
    );
  }

  void SignInUser() {
    authService.SignInUser(
      Context: context,
      Email: _email.text,
      Password: _pass.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Aboard!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  tileColor: auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: auth,
                    onChanged: (Auth? value) {
                      setState(() {
                        auth = value!;
                      });
                    },
                  ),
                ),
                if (auth == Auth.signup)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _signupkey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _name,
                            hint: 'Name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _email,
                            hint: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _pass,
                            hint: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonButton(
                              text: 'SignUp',
                              action: () {
                                if(_signupkey.currentState!.validate()){
                                  SignUpUser();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  title: const Text(
                    'SignIn to Account',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  tileColor: auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: auth,
                    onChanged: (Auth? value) {
                      setState(() {
                        auth = value!;
                      });
                    },
                  ),
                ),
                if (auth == Auth.signin)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _signinkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _email,
                            hint: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _pass,
                            hint: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonButton(
                              text: 'SignIn',
                              action: () {
                                log('hafsa signin');
                                if(_signinkey.currentState!.validate()){
                                  SignInUser();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
