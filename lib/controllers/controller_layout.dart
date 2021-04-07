import 'package:flutter/cupertino.dart';

class ControllerLayout extends ChangeNotifier {
  static final ControllerLayout instance = ControllerLayout();

  int _indexPage = 0;
  PageController pageController = PageController(initialPage: 0);

  int get indexPage => _indexPage;
  void setIndexPage({@required int newPage}) {
    _indexPage = newPage;
    notifyListeners();
  }
}
