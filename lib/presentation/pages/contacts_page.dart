

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:contact_app_null_safety/business_logic/contact/contacts_bloc.dart';
import 'package:contact_app_null_safety/data/data_providers/contacts_api.dart';
import 'package:contact_app_null_safety/data/models/contact.dart';
import 'package:contact_app_null_safety/data/repositories/contacts_repository.dart';

import 'package:http/http.dart' as http;

import 'contact_details_page.dart';


class ContactsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ContactsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: Text(
          'Contact App',
          style: TextStyle(
              color: Colors.green[900],
              fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body: RepositoryProvider(
        create: (context) {
          return ContactsRepository(contactsApi: ContactsApi(httpClient: http.Client()));
        },
        child: BlocProvider(
          create: (context) {
            return ContactsBloc(
                contactsRepository: RepositoryProvider.of<ContactsRepository>(context)
            );
          },
          child: ContactsBodyPage(),
        ),
      ),
    );
  }
}

class ContactsBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsBloc, ContactsState>(
        listener: (context, state) {
          if(state is OpenContactDetailsPage) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<ContactsBloc>(context),
                      child: ContactDetailsPage(state: state,),
                    )
                )
            );
          }
        },
        builder: (context, state) {
          if(state is ContactsInitial) {
            context.read<ContactsBloc>().add(ContactsFetched());
            return LoadingFlipping.square(
              borderColor: Colors.green[900]!,
              size: 30,
            );
          }
          else if(state is ContactsLoading) {
            return LoadingFlipping.square(
              borderColor: Colors.green[900]!,
              size: 30,
            );
          }
          else if(state is ContactsEmpty) {
            return Center(
              child: Container(
                child: Text(
                  'You don\'t have any contacts',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.green[900]
                  ),
                ),
              ),
            );
          }
          else if(state is ContactsError) {
            return Text('something went wrong');
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ContactWidget(contact: state.contacts![index],);
            },
            itemCount: state.contacts!.length,
          );

        }
    );
  }
}

class ContactWidget extends StatelessWidget {
  final Contact? contact;

  ContactWidget({this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ContactsBloc>().add(OpenContactDetails(contact!));
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 20, top: 10, right: 10, bottom: 10),
        margin: EdgeInsets.only(
            left: 10, top: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.green[900], width: 2),
            borderRadius: BorderRadius.all(
                Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  color: Colors.grey[300]!,
                  spreadRadius: 2.0
              ),
            ]
          // gradient: LinearGradient(
          //   colors: [Colors.grey[300], Colors.grey[200]],
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      contact!.recipent!.name! + " " + contact!.recipent!.lastname!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    contact!.recipent!.position!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    contact!.recipent!.company!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                ContactTools(contact!),
              ],
            ),
            // Column(
            //   children: [
            //     Padding(padding: EdgeInsets.only(
            //         bottom: 5),
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           decoration: BoxDecoration(
            //               border: Border.all(color: Colors.green[900]),
            //               borderRadius: BorderRadius.all(
            //                   Radius.circular(5.0))
            //           ),
            //           child: Center(
            //             child: Text(
            //               contact.id.toString(),
            //               style: TextStyle(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.w300
            //               ),
            //             ),
            //           ),
            //         )
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

}

class ContactTools extends StatelessWidget {
  final Contact contact;

  ContactTools(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: EdgeInsets.only(
          left: 7, top: 5, right: 7, bottom: 5),
      margin: EdgeInsets.only(
          top: 3, right: 10, bottom: 0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green[900]!),
          borderRadius: BorderRadius.all(
              Radius.circular(15.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FavouriteIcon(contact: contact),
          HideIcon(contact: contact,),
        ],
      ),
    );
  }

}

class FavouriteIcon extends StatelessWidget {
  final Contact? contact;

  FavouriteIcon({this.contact});

  @override
  Widget build(BuildContext context) {
    if(contact!.favourite == true) {
      return GestureDetector(
        onTap: () {
          context.read<ContactsBloc>().add(ChangeFavouriteEvent(contact!.id!));
        },
        child: Icon(
          Icons.star,
          color: Colors.amber,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          context.read<ContactsBloc>().add(ChangeFavouriteEvent(contact!.id!));
        },
        child: Icon(
          Icons.star_outline,
          color: Colors.amber,
        ),
      );
    }

  }
}

class HideIcon extends StatelessWidget {
  final Contact? contact;

  HideIcon({this.contact});

  @override
  Widget build(BuildContext context) {
    if(contact!.hide == true) {
      return GestureDetector(
        onTap: () {
          context.read<ContactsBloc>().add(ChangeHideEvent(contact!.id!));
        },
        child: Icon(
            Icons.visibility_off
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          context.read<ContactsBloc>().add(ChangeHideEvent(contact!.id!));
        },
        child: Icon(
            Icons.visibility
        ),
      );
    }
  }
}

