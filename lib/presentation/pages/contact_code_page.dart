

import 'package:contact_app_null_safety/business_logic/contact_code/contact_code_bloc.dart';
import 'package:contact_app_null_safety/data/data_providers/contact_code_api.dart';
import 'package:contact_app_null_safety/data/repositories/contact_code_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ContactCodePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Contact App',
          style: TextStyle(
              color: Colors.green[900],
              fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: RepositoryProvider(
        create: (context) {
          return ContactCodeRepository(contactCodeApi: ContactCodeApi());
        },
        child: BlocProvider(
          create: (context) {
            return ContactCodeBloc(
                contactCodeRepository: RepositoryProvider.of<ContactCodeRepository>(context)
            );
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ContactCodeInput(),
                  GenerateContactCodeView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class ContactCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey[300]!,
                spreadRadius: 2.0
            ),
          ]
      ),
      child: Column(
        children: [
          Text('Enter your contact code:'),
          _PinField(),
          _PinMessageSpace(),
        ],
      ),
    );
  }
}

class _PinField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCodeBloc, ContactCodeState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(10),
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              textStyle: TextStyle(
                  fontSize: 25
              ),
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  activeColor: Colors.black,
                  selectedColor: Colors.amber,
                  inactiveColor: Colors.black
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                context.read<ContactCodeBloc>().add(ContactCodeChanged(value));
              },
            ),
          );
        }
    );
  }

}

class _PinMessageSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCodeBloc, ContactCodeState>(
        builder: (context, state) {
          print(state);
          if(state is ContactCodePostLoading) {
            return Container(
              height: 20,
              child: LoadingFlipping.square(
                borderColor: Colors.green[900]!,
                size: 15,
              ),
            );
          } else if(state is ContactCodePostError) {
            return Container(
              height: 20,
              child: Text(
                'Invalid code',
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
            );
          }
          else if (state is ContactCodePostSuccess) {
            return Text('Contact added successfully');
          }
          else {
            return Container(
              height: 20,
            );
          }
        }
    );
  }

}

class GenerateContactCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey[300]!,
                spreadRadius: 2.0
            ),
          ]
      ),
      child: Center(
        child: GenerateContactCodeViewBuilder(),
      ),
    );
  }
}

class GenerateContactCodeViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCodeBloc, ContactCodeState>(
        builder: (context, state) {
          if(state is ContactCodeGetLoading) {
            return Container(
              height: 20,
              child: LoadingFlipping.square(
                borderColor: Colors.green[900]!,
                size: 15,
              ),
            );
          }
          if(state is ContactCodeGetSuccess) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text('Your contact code:')
                  ),
                  Container(
                    child: Text(
                      state.codeValue.substring(0, 3) + ' ' + state.codeValue.substring(3, 6),
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {
                      context.read<ContactCodeBloc>().add(SubmitGetNewContactCodeButton());
                    },
                    child: (
                        Text(
                          'get new contact code',
                          style: TextStyle(
                              color: Colors.green[900],
                              decoration: TextDecoration.underline
                          ),
                        )
                    ),
                  ),
                ]
            );
          }
          if(state is ContactCodeGetError) {
            return Container(
              child: Text(
                  'Something went wrong, try again'
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              context.read<ContactCodeBloc>().add(SubmitGetNewContactCodeButton());
            },
            child: Container(
              child: Text('Tap here to get new contact code'),
            ),
          );
        }
    );
  }

}
