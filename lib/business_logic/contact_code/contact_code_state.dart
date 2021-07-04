part of 'contact_code_bloc.dart';

class ContactCodeState extends Equatable {

  final String codeValue;

  ContactCodeState({this.codeValue = ''});

  ContactCodeState copyWith({required String codeValue}) {
    return ContactCodeState(
        codeValue: codeValue ?? this.codeValue
    );
  }

  @override
  List<Object> get props => [codeValue];
}

class ContactCodeInitial extends ContactCodeState {}

class ContactCodeGetLoading extends ContactCodeState {}

class ContactCodeGetError extends ContactCodeState {}

class ContactCodeGetSuccess extends ContactCodeState {

  ContactCodeGetSuccess({required String codeValue}) : super(codeValue: codeValue);
}

class ContactCodePostLoading extends ContactCodeState {}

class ContactCodePostError extends ContactCodeState{}

class ContactCodePostSuccess extends ContactCodeState{}
