import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news/core/provider/app_provider.dart';
import 'package:news/core/utiles/app_assets.dart';
import 'package:news/core/utiles/app_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(Duration(seconds: 2), (){
      if(mounted){
        Navigator.pushReplacement(context, AppRouter.home());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppProvider>(context);
    bool isDark = provider.appTheme =="dark";
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              FadeInUp(duration: Duration(seconds: 1),child: Image.asset(isDark? AppAssets.splashDark:AppAssets.splashLight,width: 320,)),
              Spacer(),
              ShakeX(delay: Duration(seconds: 1),duration: Duration(seconds: 1),child: Image.asset(isDark ? AppAssets.brandingDark:AppAssets.brandingLight,width: 250,)),
            ],
          ),
        ),
      ),
    );
  }
}
