import 'package:injectable/injectable.dart';

import '../../core/api/base_api_client.dart';

@singleton
class ApiClient extends BaseApiClient {
  ApiClient(super.dio);
}
