import 'package:flutter/material.dart';

import 'dashboard_view.dart';
import 'login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashPage(),
    );
  }
}

class MySplashPage extends StatefulWidget {
  @override
  State<MySplashPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MySplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  LoginViewClass()),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.blue,
        child: const Center(
          child: Text(
            "Splash",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
