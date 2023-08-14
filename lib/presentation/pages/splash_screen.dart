import 'dart:async';
import 'package:flutter/material.dart';

import '../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayAnimation, transfor;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Timer timer;

  /// The initState function. It is called when the widget is inserted into the tree.
  @override
  void initState() {
    super.initState();

    startTime();

    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
  }

  startTime() async {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      navigationPage();
    });
    return timer;
  }

  /// It navigates to the RegisterUser page.
  void navigationPage() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SignUpWidget()), );
    Navigator.of(context).pushNamed(AppRoutes.home);
    timer.cancel();
    Navigator.of(context).pop;
  }

  @override
  dispose() {
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }


  Future<bool> _onWillPop() async {
    return false;
  }

  /// It creates a widget that will be displayed on the screen.
  ///
  /// Args:
  ///   context (BuildContext): The current context of the widget.
  ///
  /// Returns:
  ///   A WillPopScope widget.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
                body: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: FadeTransition(
                            opacity: fadeAnimation,
                            child: Image.asset(
                              "assets/images/logoApp.png",
                              height: 250.0,
                            )),
                      ),

                    ],
                  ),
                )
            ));
      },
    );
  }
}