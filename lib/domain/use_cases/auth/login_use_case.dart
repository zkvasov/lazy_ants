import 'package:injectable/injectable.dart';
import 'package:lazy_ants/domain/repositories/auth_repository.dart';
import 'package:lazy_ants/presentation/models/user_session.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<void> call(UserSession session) {
    return _authRepository.login(session);
  }
}
