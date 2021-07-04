part of 'add_contact_details_bloc.dart';

abstract class AddContactDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactDetailsNameChanged extends AddContactDetailsEvent{
  final String name;

  ContactDetailsNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class ContactDetailsLastnameChanged extends AddContactDetailsEvent{
  final String lastname;

  ContactDetailsLastnameChanged(this.lastname);

  @override
  List<Object> get props => [lastname];
}

class ContactDetailsTelephoneNumberChanged extends AddContactDetailsEvent{
  final String telephoneNumber;

  ContactDetailsTelephoneNumberChanged(this.telephoneNumber);

  @override
  List<Object> get props => [telephoneNumber];
}

class ContactDetailsEmailChanged extends AddContactDetailsEvent{
  final String email;

  ContactDetailsEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class ContactDetailsCompanyChanged extends AddContactDetailsEvent{
  final String company;

  ContactDetailsCompanyChanged(this.company);

  @override
  List<Object> get props => [company];
}

class ContactDetailsCompanyAdressChanged extends AddContactDetailsEvent{
  final String companyAdress;

  ContactDetailsCompanyAdressChanged(this.companyAdress);

  @override
  List<Object> get props => [companyAdress];
}

class ContactDetailsPositionChanged extends AddContactDetailsEvent{
  final String position;

  ContactDetailsPositionChanged(this.position);

  @override
  List<Object> get props => [position];
}

class ContactDetailsPositionEnChanged extends AddContactDetailsEvent{
  final String positionEN;

  ContactDetailsPositionEnChanged(this.positionEN);

  @override
  List<Object> get props => [positionEN];
}

class SubmitSaveButton extends AddContactDetailsEvent{}



