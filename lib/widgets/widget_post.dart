import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

class WidgetsPost {
  static Widget text(String label,
      {double size = 20,
      TextAlign textAlign = TextAlign.justify,
      double space = 5}) {
    return Container(
      padding: EdgeInsets.only(top: space ?? 0),
      child: Text(
        label,
        textAlign: textAlign,
        style: TextStyle(fontSize: size),
      ),
    );
  }

  static fullCode(code, context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontFamily: 'monospace', fontSize: 12.0),
          children: <TextSpan>[
            DartSyntaxHighlighter(style).format(code),
          ],
        ),
      ),
    );
  }

  static Widget image(String image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        color: Colors.white,
        child: Image.network(image),
      ),
    );
  }
}
