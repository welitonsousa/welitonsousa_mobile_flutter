import 'package:dio/dio.dart';
import 'package:welitonsousa_mobile/env.dart';

BaseOptions options = BaseOptions(
  baseUrl: Env.urlBase,
  connectTimeout: 10000,
  receiveTimeout: 10000,
);
Dio dio = Dio(options);
