import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app_null_safety/data/repositories/AppUserRepository.dart';
import 'package:contact_app_null_safety/security/TokenRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {

  final AppUserRepository appUserRepository;

  RegisterUserBloc({required this.appUserRepository}) : super(RegisterUserInitial());

  @override
  Stream<RegisterUserState> mapEventToState(
      RegisterUserEvent event,
      ) async* {
    if(event is RegisterUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
      yield _mapUsernameValidationToState(event, state);
    }
    else if(event is RegisterPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
      yield _mapPasswordValidationToState(event, state);
    }
    else if(event is RegisterCountryChanged) {
      yield _mapCountryChangedToState(event, state);
      yield _mapCountryValidationToState(event, state);
    }
    else if(event is SubmitSignUpButton) {
      print('event' + state.isValidate.toString());
      yield* _mapSubmitLoginButtonToState(event, state);
    }
  }

  RegisterUserState _mapUsernameChangedToState(
      RegisterUsernameChanged event,
      RegisterUserState state
      ) {
    String username = event.username;

    return state.copyWith(
        username: username
    );
  }

  RegisterUserState _mapPasswordChangedToState(
      RegisterPasswordChanged event,
      RegisterUserState state
      ) {
    String password = event.password;

    return state.copyWith(
        password: password
    );
  }

  RegisterUserState _mapCountryChangedToState(
      RegisterCountryChanged event,
      RegisterUserState state
      ) {
    String country = event.country;

    return state.copyWith(
        country: country
    );
  }

  RegisterUserState _mapUsernameValidationToState(
      RegisterUsernameChanged event,
      RegisterUserState state
      ) {
    if(event.username.length < 5) {
      return state.copyWith(
        usernameLabelTextColor: Colors.red[900],
        usernameHintText: 'too short username',
        isValidate: [false, state.isValidate[1], state.isValidate[2]],
      );
    } else {
      return state.copyWith(
        usernameLabelTextColor: Colors.black,
        isValidate: [true, state.isValidate[1], state.isValidate[2]],
      );
    }
  }

  RegisterUserState _mapPasswordValidationToState(
      RegisterPasswordChanged event,
      RegisterUserState state
      ) {
    if(event.password.length < 5) {
      return state.copyWith(
        passwordLabelTextColor: Colors.red[900],
        passwordHintText: 'too short password',
        isValidate: [state.isValidate[0], false, state.isValidate[2]],
      );
    } else {
      return state.copyWith(
        passwordLabelTextColor: Colors.black,
        isValidate: [state.isValidate[0], true, state.isValidate[2]],

      );
    }
  }

  RegisterUserState _mapCountryValidationToState(
      RegisterCountryChanged event,
      RegisterUserState state
      ) {
    if(event.country.length < 5) {
      return state.copyWith(
        countryLabelTextColor: Colors.red[900],
        countryHintText: 'too short country name',
        isValidate: [state.isValidate[0], state.isValidate[1], false],
      );
    } else {
      return state.copyWith(
        countryLabelTextColor: Colors.black,
        isValidate: [state.isValidate[0], state.isValidate[1], true],
      );
    }
  }

  Stream<RegisterUserState> _mapSubmitLoginButtonToState(
      SubmitSignUpButton event,
      RegisterUserState state
      ) async* {

    print('stream');
    if(validator(state.isValidate)){
      yield RegisterUserLoading(
          usernameLabelTextColor: state.usernameLabelTextColor,
          passwordLabelTextColor: state.passwordLabelTextColor,
          countryLabelTextColor: state.countryLabelTextColor,
          usernameHintText: state.usernameHintText,
          passwordHintText: state.passwordHintText,
          countryHintText: state.countryHintText,
          isValidate: state.isValidate
      );

      print(state.isValidate);

      final response = await appUserRepository.registerUser(
          state.username!,
          state.password!,
          state.country!
      );

      if (response.statusCode == 200) {
        appUserRepository.tryAuthorization(state.username!, state.password!);
        print('token: ' + await getToken());
        yield RegisterUserSuccess();
      } else {
        yield RegisterUserError(
            usernameLabelTextColor: state.usernameLabelTextColor,
            passwordLabelTextColor: state.passwordLabelTextColor,
            usernameHintText: state.usernameHintText,
            passwordHintText: state.passwordHintText
        );
      }
    } else {
      print('we cannot validate this form');
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
