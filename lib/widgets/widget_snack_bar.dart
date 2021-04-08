import 'dart:async';

import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/constants/colors.dart';

class CustomSnackBar {
  static final CustomSnackBar instance = CustomSnackBar();
  final key = new GlobalKey<ScaffoldState>();

  void error({@required String text, String labelAction, Function action}) {
    Timer.run(
      () {
        ScaffoldMessenger.of(key.currentContext).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 10),
            backgroundColor: ColorsPalet.danger,
            action: action != null
                ? SnackBarAction(
                    label: labelAction,
                    textColor: ColorsPalet.light,
                    onPressed: action)
                : null,
            content: Text(
              text,
              style: TextStyle(color: ColorsPalet.light),
            ),
          ),
        );
      },
    );
  }

  void success({@required String text}) {
    Timer.run(
      () {
        ScaffoldMessenger.of(key.currentContext).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 10),
            backgroundColor: ColorsPalet.success,
            content: Text(
              text,
              style: TextStyle(color: ColorsPalet.light),
            ),
          ),
        );
      },
    );
  }
}
