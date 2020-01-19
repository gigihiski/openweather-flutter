import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/authentication/authentication_event.dart';
import 'package:weatherforecast/blocs/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc();

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      await Future.delayed(Duration(seconds: 2));
      yield AuthenticationUnauthenticated();
    }
  }
}
