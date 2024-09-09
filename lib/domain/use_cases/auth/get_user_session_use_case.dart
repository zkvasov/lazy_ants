import 'package:injectable/injectable.dart';
import 'package:lazy_ants/domain/repositories/auth_repository.dart';
import 'package:lazy_ants/presentation/models/user_session.dart';

@lazySingleton
class GetUserSessionUseCase {
  final AuthRepository _authRepository;

  GetUserSessionUseCase(this._authRepository);

  Future<UserSession?> call() {
    return _authRepository.getUserSession();
  }
}
