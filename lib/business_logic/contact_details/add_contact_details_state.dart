part of 'add_contact_details_bloc.dart';

class AddContactDetailsState extends Equatable {

  final String? name;
  final String? lastname;
  final String? telephoneNumber;
  final String? email;
  final String? company;
  final String? companyAdress;
  final String? position;
  final String? positionEN;

  final CustomTextFieldProperties nameFieldProperties;
  final CustomTextFieldProperties lastnameFieldProperties;
  final CustomTextFieldProperties telephoneNumberFieldProperties;
  final CustomTextFieldProperties emailFieldProperties;
  final CustomTextFieldProperties companyFieldProperties;
  final CustomTextFieldProperties companyAdressFieldProperties;
  final CustomTextFieldProperties positionFieldProperties;
  final CustomTextFieldProperties positionENFieldProperties;

  final List<bool> isValidate;


  AddContactDetailsState({
    this.name = '',
    this.lastname = '',
    this.telephoneNumber = '',
    this.email = '',
    this.company = '',
    this.companyAdress = '',
    this.position = '',
    this.positionEN = '',
    this.nameFieldProperties = const CustomTextFieldProperties(hintText: 'name'),
    this.lastnameFieldProperties = const CustomTextFieldProperties(hintText: 'lastname'),
    this.telephoneNumberFieldProperties = const CustomTextFieldProperties(hintText: 'telephone number'),
    this.emailFieldProperties = const CustomTextFieldProperties(hintText: 'email'),
    this.companyFieldProperties = const CustomTextFieldProperties(hintText: 'company'),
    this.companyAdressFieldProperties = const CustomTextFieldProperties(hintText: 'company adress'),
    this.positionFieldProperties = const CustomTextFieldProperties(hintText: 'position'),
    this.positionENFieldProperties = const CustomTextFieldProperties(hintText: 'position EN'),
    this.isValidate = const <bool>[false, false, false, false, false, false, false, false],});

  AddContactDetailsState copyWith({
    String? name,
    String? lastname,
    String? telephoneNumber,
    String? email,
    String? company,
    String? companyAdress,
    String? position,
    String? positionEN,
    CustomTextFieldProperties? nameFieldProperties,
    CustomTextFieldProperties? lastnameFieldProperties,
    CustomTextFieldProperties? telephoneNumberFieldProperties,
    CustomTextFieldProperties? emailFieldProperties,
    CustomTextFieldProperties? companyFieldProperties,
    CustomTextFieldProperties? companyAdressFieldProperties,
    CustomTextFieldProperties? positionFieldProperties,
    CustomTextFieldProperties? positionENFieldProperties,
    List<bool>? isValidate
  }) {
    return AddContactDetailsState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        telephoneNumber: telephoneNumber ?? this.telephoneNumber,
        email: email ?? this.email,
        company: company ?? this.company,
        companyAdress: companyAdress ?? this.companyAdress,
        position: position ?? this.position,
        positionEN: positionEN ?? this.positionEN,
        nameFieldProperties: nameFieldProperties ?? this.nameFieldProperties,
        lastnameFieldProperties: lastnameFieldProperties ?? this.lastnameFieldProperties,
        telephoneNumberFieldProperties: telephoneNumberFieldProperties ?? this.telephoneNumberFieldProperties,
        emailFieldProperties: emailFieldProperties ?? this.emailFieldProperties,
        companyFieldProperties: companyFieldProperties ?? this.companyFieldProperties,
        companyAdressFieldProperties: companyAdressFieldProperties ?? this.companyAdressFieldProperties,
        positionFieldProperties: positionFieldProperties ?? this.positionFieldProperties,
        positionENFieldProperties: positionENFieldProperties ?? this.positionENFieldProperties,
        isValidate: isValidate ?? this.isValidate
    );
  }

  @override
  List<Object> get props => [
    name!,
    lastname!,
    telephoneNumber!,
    email!,
    company!,
    companyAdress!,
    position!,
    positionEN!,
    nameFieldProperties,
    lastnameFieldProperties,
    telephoneNumberFieldProperties,
    emailFieldProperties,
    companyFieldProperties,
    companyAdressFieldProperties,
    positionFieldProperties,
    positionENFieldProperties,
    isValidate
  ];

}

class AddContactDetailsInitial extends AddContactDetailsState {}

class AddContactDetailsLoading extends AddContactDetailsState {}

class AddContactDetailsSuccess extends AddContactDetailsState {}

class AddContactDetailsError extends AddContactDetailsState {}
