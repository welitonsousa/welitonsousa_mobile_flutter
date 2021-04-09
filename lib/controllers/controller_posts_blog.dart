import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/widgets/widget_snack_bar.dart';
import '../helper/helper_dio_config.dart';
import '../models/model_posts_blog.dart';

class ControllerPostsBlog extends ChangeNotifier {
  static final ControllerPostsBlog instance = ControllerPostsBlog();
  GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  List<ModelPost> _postsBlog;
  bool _isLoading = false;

  GlobalKey<RefreshIndicatorState> get refreshKey => _refreshKey;
  bool get isLoading => _isLoading;
  List<ModelPost> get postsBlog => _postsBlog;

  Future<void> getPostsBlog() async {
    try {
      _isLoading = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 5));
      final res = await dio.get('/activities/posts');
      if (res.data['success'] == true) {
        _postsBlog = [];

        res.data['data'].forEach((e) {
          _postsBlog.add(ModelPost.fromJson(e));
        });
      }
    } catch (error) {
      _postsBlog = _postsBlog != null ? _postsBlog : [];
      CustomSnackBar.instance.error(
        text: 'Algo deu errado',
        action: getPostsBlog,
        labelAction: "tentar novamente",
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
