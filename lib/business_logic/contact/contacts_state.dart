part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  final List<Contact>? contacts;

  ContactsState({this.contacts});

  ContactsState copyWith({required List<Contact> contacts}) {
    return ContactsState(contacts: contacts ?? this.contacts);
  }

  @override
  List<Object> get props => [contacts!];
}

class ContactsInitial extends ContactsState {}

class ContactsError extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsEmpty extends ContactsState {}

class ContactsSuccess extends ContactsState {

  ContactsSuccess({required List<Contact> contacts}) : super(contacts: contacts);

}

class ContactChangeFavourite extends ContactsState {

  ContactChangeFavourite({required List<Contact> contacts}) : super(contacts: contacts);

  @override
  List<Object> get props => [contacts!];

}

class ContactsChangeHide extends ContactsState {

  ContactsChangeHide({required List<Contact> contacts}) : super(contacts: contacts);

  @override
  List<Object> get props => [contacts!];

}

class ContactsLoadingIcon extends ContactsState {}

class OpenContactDetailsPage extends ContactsState {
  final Contact contact;

  OpenContactDetailsPage({required this.contact, required List<Contact> contacts}) : super(contacts: contacts);

  @override
  List<Object> get props => [contact, contacts!];
}



