import 'package:logindemo/business_logic/blocs/login/login_event.dart';
import 'package:logindemo/business_logic/blocs/login/login_state.dart';
import 'package:logindemo/business_logic/repositories/login_repository.dart';

import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository=LoginRepository();

  // LoginBloc({this.loginRepository});

  @override
  LoginState get initialState => LoginStateDefault();

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield* _mapLoginState(event);
    }
  }

  Stream<LoginState> _mapLoginState(LoginButtonPressedEvent event) async* {
    try {
      yield LoginStateLoading();
      var result = await loginRepository.login(event.username, event.password);
      yield LoginStateLoaded(data: result);
    } catch (e) {
      yield LoginStateError();
    }
  }
}