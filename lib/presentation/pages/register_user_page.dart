
import 'package:contact_app_null_safety/business_logic/register_user/register_user_bloc.dart';
import 'package:contact_app_null_safety/data/repositories/AppUserRepository.dart';
import 'package:contact_app_null_safety/presentation/pages/add_contact_details_page.dart';
import 'package:contact_app_null_safety/presentation/widgets/app_custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';

class RegisterUserPage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterUserPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) {
              return RegisterUserBloc(
                  appUserRepository: RepositoryProvider.of<AppUserRepository>(context)
              );
            },
            child: RegisterUserPageForm(),
          ),
        ),
      ),
    );
  }
}

class RegisterUserPageForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterUserBloc, RegisterUserState>(
      listener: (context, state) {
        if(state is RegisterUserSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddContactDetailsPage())
          );
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
              'Sign up',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.green[900]
              ),
            ),
          ),
          _UsernameInput(),
          _PasswordInput(),
          _CountryInput(),
          _SignOnButton(),
          _MessageSpace(),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'username',
              hintText: state.usernameHintText,
              width: 200,
              labelTextColor: state.usernameLabelTextColor,
              onChanged: (value) {
                context.read<RegisterUserBloc>().add(RegisterUsernameChanged(value));
              }
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'password',
              hintText: state.passwordHintText,
              width: 200,
              labelTextColor: state.passwordLabelTextColor,
              obscureText: true,
              onChanged: (value) {
                context.read<RegisterUserBloc>().add(RegisterPasswordChanged(value));
              }
          );
        });
  }
}

class _CountryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'country',
              hintText: state.countryHintText,
              width: 200,
              labelTextColor: state.countryLabelTextColor,
              onChanged: (value) {
                context.read<RegisterUserBloc>().add(RegisterCountryChanged(value));
              }
          );
        });
  }
}

class _MessageSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
        builder: (context, state) {
          if (state is RegisterUserLoading) {
            return Container(
              height: 20,
              child: LoadingFlipping.square(
                borderColor: Colors.green[900]!,
                size: 15,
              ),
            );
          } else if (state is RegisterUserError) {
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

class _SignOnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterUserBloc, RegisterUserState>(
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
                  context.read<RegisterUserBloc>().add(SubmitSignUpButton());
                },
                child: Text(
                    'Sign On',
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
