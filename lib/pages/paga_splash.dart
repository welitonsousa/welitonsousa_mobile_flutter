import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PageSplash extends StatefulWidget {
  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  double size = 100;
  Ticker ticker;
  bool smalling = false;

  @override
  void initState() {
    super.initState();
    ticker = Ticker((now) {
      setState(() {
        if (size < 10) {
          Navigator.pushReplacementNamed(context, 'layout');
          ticker.stop();
          ticker.dispose();
        } else if (!smalling) {
          size += 10;
        } else {
          size -= 20;
        }
        if (size > 300) smalling = true;
      });
    });
    ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Container(
        height: this.size > 0 ? this.size : 0.0,
        child: Image.asset('assets/images/logo.png', fit: BoxFit.scaleDown),
      ),
    );
  }
}
