import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post {
  static Widget item(
      {@required String title,
      @required String subtitle,
      @required String image,
      @required Function onTap}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        width: 100,
        height: 50,
        child: Container(color: Colors.white, child: Image.network(image)),
      ),
      onTap: onTap,
    );
  }
}
