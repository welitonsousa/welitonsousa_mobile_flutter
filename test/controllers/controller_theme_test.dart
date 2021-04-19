import 'package:flutter_test/flutter_test.dart';
import 'package:welitonsousa_mobile/controllers/controller_theme.dart';

void main() {
  test('CONTROLLER: theme -> dark', () async {
    await ControllerTheme.instance.setTheme(isDark: true);
    expect(ControllerTheme.instance.theme, true);
  });

  test('CONTROLLER: theme -> ligth', () async {
    await ControllerTheme.instance.setTheme(isDark: false);
    expect(ControllerTheme.instance.theme, false);
  });
}
