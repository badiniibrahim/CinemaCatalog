/// It's a generic class that provides a set of methods to interact with a REST API
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quiver/strings.dart' as quiver;

import '../provider/api_provider.dart';

abstract class IProvider<T> {
  String get endpoint;

  String buildEndpointWithPath(path) {
    List<String?> x = [endpoint, path];

    x.removeWhere((item) => quiver.isBlank(item));

    return x.join('/');
  }

  Future<Response> list({Map<String, dynamic>? query, String? path}) async {
    final Response response = await ApiProvider.instance.get(
      endpoint:  "/movie/popular?api_key=${dotenv.env['API_KEY']}",
      queryParameters: query,
    );

    return response;
  }

  Future<Response> get(String id, [Map<String, dynamic>? query]) async {
    final Response response = await ApiProvider.instance.get(
      endpoint: "$endpoint/$id",
      queryParameters: query,
    );

    return response;
  }
}
