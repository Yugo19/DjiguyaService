import 'package:djiguya_service_app/model/user.dart';
import 'package:djiguya_service_app/ui/Home.dart';
import 'package:djiguya_service_app/ui/Login.dart';
import 'package:djiguya_service_app/ui/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    print(user);
    return Home();
  }
}
