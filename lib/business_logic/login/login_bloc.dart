import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app_null_safety/data/repositories/AppUserRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AppUserRepository appUserRepository;

  LoginBloc({required this.appUserRepository}) : super(LoginInitialState());


  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if(event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
      yield _mapUsernameValidationToState(event, state);
    } else if(event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
      yield _mapPasswordValidationToState(event, state);
    } else if(event is SubmitLoginButton) {
      yield*  _mapSubmitLoginButtonToState(event, state);
    } else if (event is SubmitSignOnButton) {
      yield GoToRegisterPage();
    }
  }

  LoginState _mapUsernameChangedToState(
      LoginUsernameChanged event,
      LoginState state
      ) {
    String username = event.username;

    return state.copyWith(
        username: username
    );
  }

  LoginState _mapPasswordChangedToState(
      LoginPasswordChanged event,
      LoginState state
      ) {
    String password = event.password;

    return state.copyWith(
        password: password
    );
  }

  LoginState _mapUsernameValidationToState(
      LoginUsernameChanged event,
      LoginState state
      ) {
    if(event.username.length < 5) {
      return state.copyWith(
        usernameLabelTextColor: Colors.red[900],
        usernameHintText: 'too short username',
        isValidate: [false, state.isValidate[1]],
      );
    } else {
      return state.copyWith(
        usernameLabelTextColor: Colors.black,
        isValidate: [true, state.isValidate[1]],
      );
    }
  }

  LoginState _mapPasswordValidationToState(
      LoginPasswordChanged event,
      LoginState state
      ) {
    if(event.password.length < 5) {
      return state.copyWith(
        passwordLabelTextColor: Colors.red[900],
        passwordHintText: 'too short password',
        isValidate: [state.isValidate[0], false],

      );
    } else {
      return state.copyWith(
        passwordLabelTextColor: Colors.black,
        isValidate: [state.isValidate[0], true],
      );
    }
  }

  Stream<LoginState> _mapSubmitLoginButtonToState(
      SubmitLoginButton event,
      LoginState state
      ) async* {
    if (validator(state.isValidate)) {
      yield LoginLoading(
          usernameLabelTextColor: state.usernameLabelTextColor,
          passwordLabelTextColor: state.passwordLabelTextColor,
          usernameHintText: state.usernameHintText,
          passwordHintText: state.passwordHintText,
          isValidate: state.isValidate
      );

      final response = await appUserRepository.tryAuthorization(
          state.username!,
          state.password!
      );

      if (response.statusCode == 200) {
        yield LoginSuccess();
      } else {
        yield LoginError(
          usernameLabelTextColor: state.usernameLabelTextColor,
          passwordLabelTextColor: state.passwordLabelTextColor,
          usernameHintText: state.usernameHintText,
          passwordHintText: state.passwordHintText,
          isValidate: state.isValidate,
        );
      }
    }
  }

  bool validator(List<bool> validations) {
    int count = 0;
    for(var i = 0; i< validations.length; i++) {
      if(validations[i] == true) {
        count++;
      }
    }
    if(count == validations.length) {
      return true;
    } else {
      return false;
    }
  }

}
