import 'package:welitonsousa_mobile/controllers/controller_layout.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/pages/page_posts_blog.dart';

class PageLayout extends StatefulWidget {
  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerLayout.instance,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: _body(),
          bottomNavigationBar: _bottomNavyBar(),
        );
      },
    );
  }

  Widget _body() {
    return SizedBox.expand(
      child: PageView(
        controller: ControllerLayout.instance.pageController,
        onPageChanged: (index) =>
            ControllerLayout.instance.setIndexPage(newPage: index),
        children: <Widget>[PagePostsBlog(), Container(color: Colors.blue)],
      ),
    );
  }

  BottomNavyBar _bottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: ControllerLayout.instance.indexPage,
      onItemSelected: (index) {
        ControllerLayout.instance.setIndexPage(newPage: index);
        ControllerLayout.instance.pageController.jumpToPage(index);
      },
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(title: Text('Blog'), icon: Icon(Icons.ballot)),
        BottomNavyBarItem(title: Text('Sobre'), icon: Icon(Icons.art_track)),
      ],
    );
  }
}
