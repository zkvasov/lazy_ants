import 'package:injectable/injectable.dart';

import '../../../core/api/base_api_client.dart';
import '../models/users/user.dart';

@singleton
class ApiClient extends BaseApiClient {
  ApiClient(super.dio);

  Future<List<User>> getUsers() async {
    return await getList<User>(
      path: '/users',
      converter: User.fromJson,
    );
  }
}
