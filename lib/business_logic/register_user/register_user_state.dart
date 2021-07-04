part of 'register_user_bloc.dart';

class RegisterUserState extends Equatable {
  final String? username;
  final String? password;
  final String? country;

  final Color? usernameLabelTextColor;
  final Color? passwordLabelTextColor;
  final Color? countryLabelTextColor;

  final String? usernameHintText;
  final String? passwordHintText;
  final String? countryHintText;

  final List<bool> isValidate;

  RegisterUserState({
    this.username = '',
    this.password = '',
    this.country = '',
    this.usernameLabelTextColor = Colors.black,
    this.passwordLabelTextColor = Colors.black,
    this.countryLabelTextColor = Colors.black,
    this.usernameHintText = 'username',
    this.passwordHintText = 'password',
    this.countryHintText = 'country',
    this.isValidate = const <bool>[false, false, false]});

  RegisterUserState copyWith({
    String? username,
    String? password,
    String? country,
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    Color? countryLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    String? countryHintText,
    List<bool>? isValidate
  }) {
    return RegisterUserState(
      username: username ?? this.username,
      password: password ?? this.password,
      country: country ?? this.country,
      usernameLabelTextColor: usernameLabelTextColor ?? this.usernameLabelTextColor,
      passwordLabelTextColor: passwordLabelTextColor ?? this.passwordLabelTextColor,
      countryLabelTextColor: countryLabelTextColor ?? this.countryLabelTextColor,
      usernameHintText: usernameHintText ?? this.usernameHintText,
      passwordHintText: passwordHintText ?? this.passwordHintText,
      countryHintText: countryHintText ?? this.countryHintText,
      isValidate: isValidate ?? this.isValidate,
    );
  }

  @override
  List<Object> get props => [
    username!,
    password!,
    country!,
    usernameLabelTextColor!,
    passwordLabelTextColor!,
    countryLabelTextColor!,
    usernameHintText!,
    passwordHintText!,
    countryHintText!,
    isValidate,
  ];
}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {

  RegisterUserLoading({
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    Color? countryLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    String? countryHintText,
    List<bool>? isValidate,
  }) : super(
    usernameLabelTextColor: usernameLabelTextColor,
    passwordLabelTextColor: passwordLabelTextColor,
    countryLabelTextColor: countryLabelTextColor,
    usernameHintText: usernameHintText,
    passwordHintText: passwordHintText,
    countryHintText: countryHintText,
    isValidate: isValidate!,
  );
}

class RegisterUserSuccess extends RegisterUserState {}

class RegisterUserError extends RegisterUserState {

  RegisterUserError({
    Color? usernameLabelTextColor,
    Color? passwordLabelTextColor,
    Color? countryLabelTextColor,
    String? usernameHintText,
    String? passwordHintText,
    String? countryHintText,
    List<bool>? isValidate,
  }) : super(
    usernameLabelTextColor: usernameLabelTextColor,
    passwordLabelTextColor: passwordLabelTextColor,
    countryLabelTextColor: countryLabelTextColor,
    usernameHintText: usernameHintText,
    passwordHintText: passwordHintText,
    countryHintText: countryHintText,
    isValidate: isValidate!,
  );
}
