import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testing_project/encryption_service%20.dart';

import 'dashboard_view.dart';

class LoginViewClass extends StatefulWidget {
  @override
  _LoginViewClassState createState() => _LoginViewClassState();
}

class _LoginViewClassState extends State<LoginViewClass> {
  var emailController = TextEditingController(),
      passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
               const SizedBox(
                  height: 50,
                ),
                Container(
                  child: TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter email";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Write email", prefixIcon: Icon(Icons.email)),
                  ),
                ),
                Container(
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      }
                    },
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "Write password",
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final String plainEmail = emailController.text.trim();
                      final String plainPassword = passwordController.text;

                      final encryptionService = EncryptionService.shared;
                      encryptionService.config(
                        plainEmail: plainEmail,
                        plainPassword: plainPassword,
                      );

                      final String encryptedPassword =
                          encryptionService.getEncryptedBase64Password();
                      final String bcryptedPassword =
                          encryptionService.getBcryptedPassword();
                      final String iv = encryptionService.getBase16IV();

                      var body = json.encode({
                        "email": plainEmail,
                        "password": encryptedPassword,
                        "fto": bcryptedPassword,
                        "hex": iv,
                      });

                      print("body  ${body}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashBoard()),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
