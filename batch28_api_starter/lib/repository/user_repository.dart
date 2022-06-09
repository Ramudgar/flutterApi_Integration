import 'package:batch28_api_starter/api/user_api.dart';

import '../model/user.dart';

class UserRepository {
  Future<bool> reigisterUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> login(String username, String password) {
    return UserApi().login(username, password);
  }
}
