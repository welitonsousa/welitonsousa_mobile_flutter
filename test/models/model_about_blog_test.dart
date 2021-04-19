import 'package:flutter_test/flutter_test.dart';
import 'package:welitonsousa_mobile/helper/helper_dio_config.dart';
import 'package:welitonsousa_mobile/models/model_profile_about.dart';

void main() {
  test('MODEL: about -> response', () async {
    final res = await dio.get('/profile');
    expect(res.data['success'], true);
  });

  test('MODEL: about -> convert of type', () async {
    try {
      final res = await dio.get('/profile');
      if (res.data['success'] == true) {
        Profile profile = Profile.fromJson(res.data["data"]);
      }
    } catch (error) {
      throw new Exception('No convert type about');
    }
  });
}
