import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app_null_safety/data/repositories/contact_details_repository.dart';
import 'package:contact_app_null_safety/helpers/form_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_contact_details_event.dart';
part 'add_contact_details_state.dart';

class AddContactDetailsBloc extends Bloc<AddContactDetailsEvent, AddContactDetailsState> {

  final ContactDetailsRepository contactDetailsRepository;

  AddContactDetailsBloc({required this.contactDetailsRepository}) : super(AddContactDetailsInitial());


  @override
  Stream<AddContactDetailsState> mapEventToState(
      AddContactDetailsEvent event)
  async* {
    if(event is ContactDetailsNameChanged) {
      yield _mapNameChangedToState(event, state);
      yield _mapNameValidationToState(event, state);
    }
    else if(event is ContactDetailsLastnameChanged) {
      yield _mapLastnameChangedToState(event, state);
      yield _mapLastnameValidationToState(event, state);
    }
    else if(event is ContactDetailsTelephoneNumberChanged) {
      yield _mapTelephoneNumberChangedToState(event, state);
      yield _mapTelephoneNumberValidationToState(event, state);
    }
    else if(event is ContactDetailsEmailChanged) {
      yield _mapEmailChangedToState(event, state);
      yield _mapEmailValidationToState(event, state);
    }
    else if(event is ContactDetailsCompanyChanged) {
      yield _mapCompanyChangedToState(event, state);
      yield _mapCompanyValidationToState(event, state);
    }
    else if(event is ContactDetailsCompanyAdressChanged) {
      yield _mapCompanyAdressToState(event, state);
      yield _mapCompanyAdressValidationToState(event, state);
    }
    else if(event is ContactDetailsPositionChanged) {
      yield _mapPositionChangedToState(event, state);
      yield _mapPositionValidationToState(event, state);
    }
    else if(event is ContactDetailsPositionEnChanged) {
      yield _mapPositionEnChangedToState(event, state);
      yield _mapPositionEnValidationToState(event, state);
    }
    else if(event is SubmitSaveButton) {
      yield* _mapSubmitSignOnButton(event, state);
    }
  }

  AddContactDetailsState _mapNameChangedToState(
      ContactDetailsNameChanged event,
      AddContactDetailsState state
      ) {
    String name = event.name;

    return state.copyWith(
        name: name
    );
  }


  AddContactDetailsState _mapLastnameChangedToState(
      ContactDetailsLastnameChanged event,
      AddContactDetailsState state
      ) {
    String lastname = event.lastname;

    return state.copyWith(
        lastname: lastname
    );
  }

  AddContactDetailsState _mapTelephoneNumberChangedToState(
      ContactDetailsTelephoneNumberChanged event,
      AddContactDetailsState state
      ) {
    String telephoneNumber = event.telephoneNumber;

    return state.copyWith(
        telephoneNumber: telephoneNumber
    );
  }

  AddContactDetailsState _mapEmailChangedToState(
      ContactDetailsEmailChanged event,
      AddContactDetailsState state
      ) {
    String email = event.email;

    return state.copyWith(
        email: email
    );
  }

  AddContactDetailsState _mapCompanyChangedToState(
      ContactDetailsCompanyChanged event,
      AddContactDetailsState state
      ) {
    String company = event.company;

    return state.copyWith(
        company: company
    );
  }

  AddContactDetailsState _mapCompanyAdressToState(
      ContactDetailsCompanyAdressChanged event,
      AddContactDetailsState state
      ) {
    String companyAdress = event.companyAdress;

    return state.copyWith(
        companyAdress: companyAdress
    );
  }

  AddContactDetailsState _mapPositionChangedToState(
      ContactDetailsPositionChanged event,
      AddContactDetailsState state
      ) {
    String position = event.position;

    return state.copyWith(
        position: position
    );
  }

  AddContactDetailsState _mapPositionEnChangedToState(
      ContactDetailsPositionEnChanged event,
      AddContactDetailsState state
      ) {
    String positionEN = event.positionEN;

    return state.copyWith(
        positionEN: positionEN
    );
  }

  AddContactDetailsState _mapNameValidationToState(
      ContactDetailsNameChanged event,
      AddContactDetailsState state
      ) {
    if(event.name.length < 5) {
      return state.copyWith(
          nameFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid name',
          ),
          isValidate: [
            false,
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          nameFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'name',
          ),
          isValidate: [
            true,
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }
  }


  AddContactDetailsState _mapLastnameValidationToState(
      ContactDetailsLastnameChanged event,
      AddContactDetailsState state
      ) {
    if(event.lastname.length < 5) {
      return state.copyWith(
          lastnameFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid lastname',
          ),
          isValidate: [
            state.isValidate[0],
            false,
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          lastnameFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'lastname',
          ),
          isValidate: [
            state.isValidate[0],
            true,
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }

  }

  AddContactDetailsState _mapTelephoneNumberValidationToState(
      ContactDetailsTelephoneNumberChanged event,
      AddContactDetailsState state
      ) {
    if(event.telephoneNumber.length < 5) {
      return state.copyWith(
          telephoneNumberFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid telephone number',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            false,
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          telephoneNumberFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'telephone number',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            true,
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }
  }

  AddContactDetailsState _mapEmailValidationToState(
      ContactDetailsEmailChanged event,
      AddContactDetailsState state
      ) {
    if(event.email.length < 5) {
      return state.copyWith(
          emailFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid email',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            false,
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          emailFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'email',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            true,
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }
  }

  AddContactDetailsState _mapCompanyValidationToState(
      ContactDetailsCompanyChanged event,
      AddContactDetailsState state
      ) {
    if(event.company.length < 5) {
      return state.copyWith(
          companyFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid company name',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            false,
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          companyFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'company name',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            true,
            state.isValidate[5],
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }

  }

  AddContactDetailsState _mapCompanyAdressValidationToState(
      ContactDetailsCompanyAdressChanged event,
      AddContactDetailsState state
      ) {
    if(event.companyAdress.length < 5) {
      return state.copyWith(
          companyAdressFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid company adress',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            false,
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          companyAdressFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'company adress',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            true,
            state.isValidate[6],
            state.isValidate[7]
          ]
      );
    }

  }

  AddContactDetailsState _mapPositionValidationToState(
      ContactDetailsPositionChanged event,
      AddContactDetailsState state
      ) {
    if(event.position.length < 5) {
      return state.copyWith(
          positionFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid position name',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            false,
            state.isValidate[7]
          ]
      );
    } else {
      return state.copyWith(
          positionFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'position',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            true,
            state.isValidate[7]
          ]
      );
    }

  }

  AddContactDetailsState _mapPositionEnValidationToState(
      ContactDetailsPositionEnChanged event,
      AddContactDetailsState state
      ) {
    if(event.positionEN.length < 5) {
      return state.copyWith(
          positionENFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.red[900]!,
            hintText: 'invalid position EN',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            false
          ]
      );
    } else {
      return state.copyWith(
          positionENFieldProperties: CustomTextFieldProperties(
            labelColor: Colors.black,
            hintText: 'position EN',
          ),
          isValidate: [
            state.isValidate[0],
            state.isValidate[1],
            state.isValidate[2],
            state.isValidate[3],
            state.isValidate[4],
            state.isValidate[5],
            state.isValidate[6],
            true
          ]
      );
    }
  }

  Stream<AddContactDetailsState> _mapSubmitSignOnButton(
      SubmitSaveButton event,
      AddContactDetailsState state
      ) async* {
    if(validator(state.isValidate)) {
      yield AddContactDetailsLoading();

      final response = await contactDetailsRepository.addContactDetails(
          state.name!,
          state.lastname!,
          state.telephoneNumber!,
          state.email!,
          state.company!,
          state.companyAdress!,
          state.position!,
          state.positionEN!);

      print(response.statusCode);

      if(response.statusCode == 200) {
        yield AddContactDetailsSuccess();
      } else {
        yield AddContactDetailsError();
      }
    }
  }

  bool validator(List<bool> validations) {
    int count = 0;
    for(var i = 0; i< validations.length; i++) {
      if(validations[i] == true) {
        count++;
      }
    }
    if(count == validations.length) {
      return true;
    } else {
      return false;
    }
  }

}

