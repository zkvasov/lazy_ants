import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/bloc/base_cubit.dart';
import '../../../domain/use_cases/auth/get_user_session_use_case.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends BaseCubit<LoginPageState> {
  final GetUserSessionUseCase _getUserSessionUseCase;

  LoginPageCubit(this._getUserSessionUseCase)
      : super(const LoginPageState(
          status: LoginPageStatus.loading,
        )) {
    _init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LoginPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> _init() {
    return makeErrorHandledCall(() async {
      final session = await _getUserSessionUseCase.call();
      if (session == null) {
        emit(state.copyWith(status: LoginPageStatus.idle));
      } else {
        emit(state.copyWith(status: LoginPageStatus.success));
      }
    });
  }
}
