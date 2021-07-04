

import 'package:contact_app_null_safety/business_logic/contact/contacts_bloc.dart';
import 'package:contact_app_null_safety/presentation/pages/contacts_page.dart';
import 'package:contact_app_null_safety/presentation/widgets/custom_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactDetailsPage extends StatelessWidget {
  final OpenContactDetailsPage? state;

  ContactDetailsPage({this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
          style: TextStyle(
              color: Colors.green[900]
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.green[900]
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: 5, top: 30, right: 5, bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5
                      )
                  )
              ),
              child: Text(
                state!.contact.recipent!.name! + ' ' + state!.contact.recipent!.lastname!,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.green[900]
                ),
              ),
            ),
            CustomDataWidget('Telephone number', state!.contact.recipent!.telephoneNumber!),
            CustomDataWidget('Email', state!.contact.recipent!.email!),
            CustomDataWidget('Company', state!.contact.recipent!.company!),
            CustomDataWidget('Company Adress', state!.contact.recipent!.companyAdress!),
            CustomDataWidget('Position', state!.contact.recipent!.position!),
            CustomDataWidget('Position EN', state!.contact.recipent!.positionEN!),
            CustomDataWidget('Created at', state!.contact.createdAt!),
            BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, contactsState) {
                  return ContactTools(state!.contact);
                }
            ),
          ],
        ),
      ),
    );
  }


}