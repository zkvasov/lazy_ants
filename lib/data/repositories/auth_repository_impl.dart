import 'package:lazy_ants/data/data_sources/storage/dao/user_session_dao.dart';
import 'package:lazy_ants/domain/repositories/auth_repository.dart';
import 'package:lazy_ants/presentation/models/user_session.dart';

import '../../core/repository/base_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final UserSessionDao _userSessionDao;

  AuthRepositoryImpl(this._userSessionDao);

  @override
  Future<UserSession?> getUserSession() {
    return makeErrorParsedCall(() {
      return _userSessionDao.getSession();
    });
  }

  @override
  Future<void> login(UserSession session) {
    return makeErrorParsedCall(() {
      return _userSessionDao.insertSession(session);
    });
  }
}
