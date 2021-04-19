import 'package:flutter_test/flutter_test.dart';
import 'package:welitonsousa_mobile/helper/helper_dio_config.dart';
import 'package:welitonsousa_mobile/models/model_posts_blog.dart';

void main() {
  test('MODEL: pots -> response', () async {
    final res = await dio.get('/activities/posts');
    expect(res.data["success"], true);
  });
  test('MODEL: pots -> convert of type', () async {
    final res = await dio.get('/activities/posts');
    try {
      List<ModelPost> posts = [];
      res.data["data"].forEach((e) {
        posts.add(ModelPost.fromJson(e));
      });
    } catch (e) {
      throw new Exception('No convert of type on ModelPost');
    }
  });
}
