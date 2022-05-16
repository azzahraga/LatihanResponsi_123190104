import 'base_network.dart';

class GithubDataSource {
  static GithubDataSource instance = GithubDataSource();
  Future<Map<String, dynamic>> loadUser(String username) {

    return BaseNetwork.get("users/"+username);
  }
}