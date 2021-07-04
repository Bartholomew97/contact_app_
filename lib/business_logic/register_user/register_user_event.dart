part of 'register_user_bloc.dart';

abstract class RegisterUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUsernameChanged extends RegisterUserEvent {
  final String username;

  RegisterUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class RegisterPasswordChanged extends RegisterUserEvent {
  final String password;

  RegisterPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegisterCountryChanged extends RegisterUserEvent {
  final String country;

  RegisterCountryChanged(this.country);

  @override
  List<Object> get props => [country];
}

class SubmitSignUpButton extends RegisterUserEvent {}
