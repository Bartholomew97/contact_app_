part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? username;
  final String? password;

  final Color? usernameLabelTextColor;
  final Color? passwordLabelTextColor;

  final String? usernameHintText;
  final String? passwordHintText;

  final List<bool> isValidate;

  LoginState({this.username = '',
    this.password = '',
    this.usernameLabelTextColor = Colors.black,
    this.passwordLabelTextColor = Colors.black,
    this.usernameHintText = 'username',
    this.passwordHintText = 'password',
    this.isValidate = const <bool>[false, false],
  });

  LoginState copyWith({
    String? username,
    String? password,
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    List<bool>? isValidate,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      usernameLabelTextColor: usernameLabelTextColor ?? this.usernameLabelTextColor,
      passwordLabelTextColor: passwordLabelTextColor ?? this.passwordLabelTextColor,
      usernameHintText: usernameHintText ?? this.usernameHintText,
      passwordHintText: passwordHintText ?? this.passwordHintText,
      isValidate: isValidate ?? this.isValidate,
    );
  }

  @override
  List<Object> get props => [
    username!,
    password!,
    usernameLabelTextColor!,
    passwordLabelTextColor!,
    usernameHintText!,
    passwordHintText!,
    isValidate,
  ];

}

class LoginInitialState extends LoginState {}

class LoginLoading extends LoginState{

  LoginLoading({
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    List<bool>? isValidate,
  }) : super(
    usernameLabelTextColor: usernameLabelTextColor,
    passwordLabelTextColor: passwordLabelTextColor,
    usernameHintText: usernameHintText,
    passwordHintText: passwordHintText,
    isValidate: isValidate!,
  );
}

class LoginSuccess extends LoginState{}

class LoginError extends LoginState{
  LoginError({
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    List<bool>? isValidate,
  }) : super(
    usernameLabelTextColor: usernameLabelTextColor,
    passwordLabelTextColor: passwordLabelTextColor,
    usernameHintText: usernameHintText,
    passwordHintText: passwordHintText,
    isValidate: isValidate!,
  );
}

class GoToRegisterPage extends LoginState{}
