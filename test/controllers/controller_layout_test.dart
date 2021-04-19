import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:welitonsousa_mobile/controllers/controller_layout.dart';

void main() {
  test('CONTROLLER: layout -> page about', () {
    ControllerLayout.instance.setIndexPage(newPage: 1);
    expect(ControllerLayout.instance.indexPage, 1);
  });

  test('CONTROLLER: layout -> page posts', () {
    ControllerLayout.instance.setIndexPage(newPage: 0);
    expect(ControllerLayout.instance.indexPage, 0);
  });
}
