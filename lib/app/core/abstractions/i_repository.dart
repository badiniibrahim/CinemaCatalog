import 'package:dio/dio.dart';

import 'i_provider.dart';

abstract class IRepository<T> {
  IProvider<T> get provider;

  Future<Response> find(String id, [Map<String, dynamic>? query]) async =>
      await provider.get(id, query);
}
