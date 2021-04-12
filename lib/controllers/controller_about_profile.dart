import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/models/model_profile_about.dart';
import 'package:welitonsousa_mobile/widgets/widget_snack_bar.dart';
import '../helper/helper_dio_config.dart';

class ControllerAbountProfile extends ChangeNotifier {
  static final ControllerAbountProfile instance = ControllerAbountProfile();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  int _counterItems = 0;

  Profile _profile;
  bool _isLoading = false;
  int get counterItems => _counterItems;
  GlobalKey<RefreshIndicatorState> get refreshKey => _refreshKey;
  bool get isLoading => _isLoading;
  Profile get profile => _profile;

  Future<void> getProfile() async {
    try {
      _isLoading = true;
      notifyListeners();

      final res = await dio.get('/profile');
      if (res.data['success'] == true) {
        _profile = Profile.fromJson(res.data["data"]);
        _counterItems = 1;
      }
    } catch (error) {
      _profile = _profile != null ? _profile : Profile();
      CustomSnackBar.instance.error(
        text: 'Algo deu errado',
        action: getProfile,
        labelAction: "tente novamente",
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
