import '../../presentation/models/user_session.dart';

abstract class AuthRepository {
  Future<UserSession?> getUserSession();
}
