import 'package:djiguya_service_app/ui/Login.dart';
import 'package:djiguya_service_app/ui/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleView: toggleView);
    } else if (!showSignIn) {
      return Register(toggleView: toggleView);
    }
    throw 0;
  }
}
