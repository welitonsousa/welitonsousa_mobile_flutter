import 'package:flutter/cupertino.dart';
import 'package:welitonsousa_mobile/constants/prefs.dart';
import 'package:welitonsousa_mobile/widgets/widget_snack_bar.dart';

class ControllerTheme extends ChangeNotifier {
  static final ControllerTheme instance = ControllerTheme();
  final String _keyTheme = 'isDarkTheme';
  bool _isDarktheme = false;

  bool get theme => _isDarktheme;
  Future<void> setTheme({@required bool isDark}) async {
    try {
      await Prefs.setBool(_keyTheme, isDark);
      _isDarktheme = isDark;
      notifyListeners();
    } catch (error) {
      CustomSnackBar.instance.error(
        text: 'Falha',
        action: () => setTheme(isDark: isDark),
        labelAction: 'Tentar Novamente',
      );
    }
  }

  Future<void> getIsDarkTheme() async {
    _isDarktheme = await Prefs.getBool(instance._keyTheme);
    notifyListeners();
  }
}
