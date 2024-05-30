import 'baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadAgent() {
    return BaseNetwork.get("agents/");
  }

  Future<Map<String, dynamic>> loadDetailAgent(String idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("agents/$id");
  }

  Future<Map<String, dynamic>> loadMap() {
    return BaseNetwork.get("maps");
  }
}
