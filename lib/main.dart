import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:welitonsousa_mobile/controllers/controller_posts_blog.dart';
import 'package:welitonsousa_mobile/controllers/controller_theme.dart';
import 'package:welitonsousa_mobile/env.dart';
import 'package:welitonsousa_mobile/pages/page_layout.dart';
import 'package:welitonsousa_mobile/pages/page_post.dart';
import 'package:welitonsousa_mobile/widgets/widget_snack_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Future<void> getTheme() async {
  await ControllerTheme.instance.getIsDarkTheme();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OneSignal.shared.init(env.fireKey);
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
    OneSignal.shared.setNotificationReceivedHandler((notification) {
      OSNotification a = notification;
      String title = a.payload.title;
      CustomSnackBar.instance.success(text: title);
      ControllerPostsBlog.instance.refreshKey.currentState.show();
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeData.dark().primaryColor,
    ));
    return AnimatedBuilder(
      animation: ControllerTheme.instance,
      builder: (BuildContext context, Widget child) {
        return MaterialApp(
          title: env.title,
          debugShowCheckedModeBanner: env.showBanner,
          theme: _controllerTheme(),
          initialRoute: 'layout',
          builder: (BuildContext context, Widget child) {
            return Scaffold(
              key: CustomSnackBar.instance.key,
              body: child,
            );
          },
          routes: {
            'layout': (BuildContext context) => PageLayout(),
            'post': (BuildContext context, {post}) => PagePost(),
          },
        );
      },
    );
  }

  ThemeData _controllerTheme() {
    return ControllerTheme.instance.theme
        ? ThemeData.dark()
        : ThemeData.light();
  }
}
