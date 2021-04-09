import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:welitonsousa_mobile/controllers/controller_layout.dart';
import 'package:welitonsousa_mobile/pages/page_layout.dart';
import '../screen_context.dart';

void main() {
  testWidgets('PAGE: Change screen on layout -> about',
      (WidgetTester screen) async {
    await screen.pumpWidget(createWidgetForTesting(child: new PageLayout()));
    final Finder buttomAbout = find.byIcon(Icons.art_track);

    await screen.tap(buttomAbout);
    expect(ControllerLayout.instance.indexPage, 1);
  });

  testWidgets('PAGE: Change screen on layout -> blog',
      (WidgetTester screen) async {
    await screen.pumpWidget(createWidgetForTesting(child: new PageLayout()));
    final Finder buttomBlog = find.byIcon(Icons.ballot);

    await screen.tap(buttomBlog);
    expect(ControllerLayout.instance.indexPage, 0);
  });
}
