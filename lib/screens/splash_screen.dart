import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isLogin(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
