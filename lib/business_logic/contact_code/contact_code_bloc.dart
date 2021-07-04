import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app_null_safety/data/repositories/contact_code_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'contact_code_event.dart';
part 'contact_code_state.dart';

class ContactCodeBloc extends Bloc<ContactCodeEvent, ContactCodeState> {
  final ContactCodeRepository contactCodeRepository;

  ContactCodeBloc({required this.contactCodeRepository}) : super(ContactCodeInitial());

  @override
  Stream<ContactCodeState> mapEventToState(
      ContactCodeEvent event,
      ) async* {
    print(event);
    if(event is ContactCodeChanged) {
      yield* _mapCodeValueChangedToState(event, state);
    }
    else if (event is SubmitGetNewContactCodeButton) {
      yield* _mapGetNewContactCodeToState(event, state);
    }
  }

  Stream<ContactCodeState> _mapCodeValueChangedToState(
      ContactCodeChanged event,
      ContactCodeState state
      ) async* {
    String codeValue = event.codeValue;

    if(codeValue.length == 6) {
      yield ContactCodePostLoading();

      Response response = await contactCodeRepository.addContactWithContactCode(codeValue);

      if(response.statusCode == 200) {
        yield ContactCodePostSuccess();
      } else {
        yield ContactCodePostError();
      }
    }

    if(codeValue.length > 6) {
      yield state.copyWith(codeValue: codeValue);
    }
  }

  Stream<ContactCodeState> _mapGetNewContactCodeToState(
      SubmitGetNewContactCodeButton event,
      ContactCodeState state
      ) async* {
    yield ContactCodeGetLoading();

    String codeValue = await contactCodeRepository.getContactCode();

    if(codeValue.isNotEmpty) {
      yield ContactCodeGetSuccess(codeValue: codeValue);
    } else {
      yield ContactCodeGetError();
    }
  }
}

