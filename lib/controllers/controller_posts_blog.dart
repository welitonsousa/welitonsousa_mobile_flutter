import 'package:flutter/cupertino.dart';
import '../helper/helper_dio_config.dart';
import '../models/model_posts_blog.dart';

class ControllerPostsBlog extends ChangeNotifier {
  static final ControllerPostsBlog instance = ControllerPostsBlog();

  List<ModelPost> _postsBlog;
  bool _isLoading = false;
  bool _error = false;

  bool get error => _error;
  bool get isLoading => _isLoading;
  List<ModelPost> get postsBlog => _postsBlog;

  Future<void> getPostsBlog() async {
    try {
      _isLoading = true;
      notifyListeners();

      final res = await dio.get('/posts');
      if (res.data['success'] == true) {
        if (_postsBlog == null) _postsBlog = [];

        res.data['data'].forEach((e) {
          _postsBlog.add(ModelPost.fromJson(e));
        });
      }
      _error = false;
    } catch (error) {
      _postsBlog = _postsBlog != null ? _postsBlog : [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
