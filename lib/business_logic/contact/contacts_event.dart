part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactsFetched extends ContactsEvent {}

class OpenContactDetails extends ContactsEvent {
  final Contact contact;

  OpenContactDetails(this.contact);

  @override
  List<Object> get props => [contact];
}

class ChangeFavouriteEvent extends ContactsEvent {
  final int contactId;

  ChangeFavouriteEvent(this.contactId);

  @override
  List<Object> get props => [contactId];
}

class ChangeHideEvent extends ContactsEvent {
  final int contactId;

  ChangeHideEvent(this.contactId);

  @override
  List<Object> get props => [contactId];
}
