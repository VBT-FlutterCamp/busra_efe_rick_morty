import 'package:dio/dio.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instace;
  static ProjectNetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = ProjectNetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = 'https://rickandmortyapi.com/api';
  late final Dio dio;

  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}
