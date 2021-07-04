part of 'contact_code_bloc.dart';

abstract class ContactCodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitGetNewContactCodeButton extends ContactCodeEvent {}

class ContactCodeChanged extends ContactCodeEvent {
  final String codeValue;

  ContactCodeChanged(this.codeValue);

  @override
  List<Object> get props => [codeValue];
}
