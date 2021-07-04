
import 'package:contact_app_null_safety/business_logic/contact_details/add_contact_details_bloc.dart';
import 'package:contact_app_null_safety/data/data_providers/contact_details_api.dart';
import 'package:contact_app_null_safety/data/repositories/contact_details_repository.dart';
import 'package:contact_app_null_safety/presentation/widgets/app_custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';


class AddContactDetailsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AddContactDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: RepositoryProvider(
            create: (context) {
              return ContactDetailsRepository(contactDetailsApi: ContactDetailsApi());
            },
            child: BlocProvider(
              create: (context) {
                return AddContactDetailsBloc(
                    contactDetailsRepository: RepositoryProvider.of<ContactDetailsRepository>(context)
                );
              },
              child: AddContactDetailsForm(),
            ),
          ),
        ),
      ),
    );
  }

}

class AddContactDetailsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddContactDetailsBloc, AddContactDetailsState>(
      listener: (context, state) {
        if(state is AddContactDetailsSuccess) {
          print('success');
        }
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: 5, top: 5, right: 5, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5
                    )
                )
            ),
            child: Text(
              'Add your contact details!',
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 50
              ),
            ),
          ),
          _NameInput(),
          _LastnameInput(),
          _TelephoneNumberInput(),
          _EmailInput(),
          _CompanyInput(),
          _CompanyAdressInput(),
          _PositionInput(),
          _PositionENInput(),
          _SignSaveButton(),
          _MessageSpace(),
        ],
      ),
    );
  }

}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'name',
              hintText: state.nameFieldProperties.hintText,
              width: 200,
              labelTextColor: state.nameFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsNameChanged(value));
              }
          );
        }
    );
  }

}

class _LastnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'lastname',
              hintText: state.lastnameFieldProperties.hintText,
              width: 200,
              labelTextColor: state.lastnameFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsLastnameChanged(value));
              }
          );
        }
    );
  }

}

class _TelephoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'telephone',
              hintText: state.telephoneNumberFieldProperties.hintText,
              width: 200,
              labelTextColor: state.telephoneNumberFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsTelephoneNumberChanged(value));
              }
          );
        }
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'email',
              hintText: state.emailFieldProperties.hintText,
              width: 200,
              labelTextColor: state.emailFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsEmailChanged(value));
              }
          );
        }
    );
  }

}

class _CompanyInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'company',
              hintText: state.companyFieldProperties.hintText,
              width: 200,
              labelTextColor: state.companyFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsCompanyChanged(value));
              }
          );
        }
    );
  }
}

class _CompanyAdressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'company adress',
              hintText: state.companyAdressFieldProperties.hintText,
              width: 200,
              labelTextColor: state.companyAdressFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsCompanyAdressChanged(value));
              }
          );
        }
    );
  }
}

class _PositionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'position',
              hintText: state.positionFieldProperties.hintText,
              width: 200,
              labelTextColor: state.positionFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsPositionChanged(value));
              }
          );
        }
    );
  }
}

class _PositionENInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'position EN',
              hintText: state.positionENFieldProperties.hintText,
              width: 200,
              labelTextColor: state.positionENFieldProperties.labelColor,
              onChanged: (value) {
                context.read<AddContactDetailsBloc>().add(ContactDetailsPositionEnChanged(value));
              }
          );
        }
    );
  }

}

class _SignSaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          return Container(
              margin: EdgeInsets.only(
                  left: 30, top: 15, right: 30, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.all(
                      Radius.circular(3.0))
              ),
              child: FlatButton(
                onPressed: () {
                  context.read<AddContactDetailsBloc>().add(SubmitSaveButton());
                },
                child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    )
                ),
              )
          );
        }
    );
  }

}

class _MessageSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactDetailsBloc, AddContactDetailsState>(
        builder: (context, state) {
          if (state is AddContactDetailsLoading) {
            return Container(
              height: 20,
              child: LoadingFlipping.square(
                borderColor: Colors.green[900]!,
                size: 15,
              ),
            );
          } else if (state is AddContactDetailsError) {
            return Container(
              height: 20,
              child: Text(
                'Something went wrong, try again',
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
            );
          } else {
            return Container(
              height: 20,
            );
          }
        }
    );
  }
}

