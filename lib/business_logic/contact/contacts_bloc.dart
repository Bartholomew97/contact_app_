import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app_null_safety/data/models/contact.dart';
import 'package:contact_app_null_safety/data/repositories/contacts_repository.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepository contactsRepository;

  ContactsBloc({required this.contactsRepository}) : super(ContactsInitial());

  @override
  Stream<ContactsState> mapEventToState(
      ContactsEvent event,
      ) async* {
    if(event is ContactsFetched) {
      yield* _mapContactsFetched(event, state);
    }
    else if(event is ChangeFavouriteEvent) {
      yield* _mapFavouriteChangeToState(event, state);
    }
    else if(event is ChangeHideEvent) {
      yield* _mapHideChangeToState(event, state);
    }
    else if(event is OpenContactDetails) {
      yield OpenContactDetailsPage(contact: event.contact, contacts: state.contacts!);
    }
  }

  Stream<ContactsState> _mapContactsFetched(
      ContactsEvent event,
      ContactsState state
      ) async* {
    yield ContactsLoading();

    final List<Contact> contacts = await contactsRepository.fetchContacts();

    if(contacts.isEmpty) {
      yield ContactsEmpty();
    }
    else if(contacts.isNotEmpty) {
      yield ContactsSuccess(contacts: contacts);
    } else {
      yield ContactsError();
    }
  }

  Stream<ContactsState> _mapFavouriteChangeToState(
      ChangeFavouriteEvent event,
      ContactsState state
      ) async* {
    final response = await contactsRepository.changeFavourite(event.contactId.toString());

    if(response.statusCode != 200) {
      yield ContactsError();
    }
    final List<Contact> changedContacts = _changeContactFavouriteById(state.contacts!, event.contactId);

    yield ContactsLoadingIcon();

    yield ContactChangeFavourite(contacts: changedContacts);
  }

  Stream<ContactsState> _mapHideChangeToState(
      ChangeHideEvent event,
      ContactsState state
      ) async* {
    final response = await contactsRepository.changeHide(event.contactId.toString());

    if(response.statusCode != 200) {
      yield ContactsError();
    }
    final List<Contact> changedContacts = _changeContactHideById(state.contacts!, event.contactId);

    yield ContactsLoadingIcon();

    yield ContactsChangeHide(contacts: changedContacts);
  }
}



List<Contact> _changeContactFavouriteById(List<Contact> contacts, int contactId) {

  contacts.forEach((element) {
    if(element.id == contactId) {
      element.favourite = !element.favourite;
    }
  });

  return contacts;
}

List<Contact> _changeContactHideById(List<Contact> contacts, int contactId) {

  contacts.forEach((element) {
    if(element.id == contactId) {
      element.hide = !element.hide;
    }
  });

  return contacts;
}