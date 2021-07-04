

import 'package:contact_app_null_safety/business_logic/login/login_bloc.dart';
import 'package:contact_app_null_safety/data/data_providers/AppUserApi.dart';
import 'package:contact_app_null_safety/data/repositories/AppUserRepository.dart';
import 'package:contact_app_null_safety/presentation/pages/register_user_page.dart';
import 'package:contact_app_null_safety/presentation/widgets/app_custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget  {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: RepositoryProvider(
            create: (context) {
              return AppUserRepository(appUserApi: AppUserApi());
            },
            child: BlocProvider(
              create: (context) {
                return LoginBloc(
                    appUserRepository: RepositoryProvider.of<AppUserRepository>(context)
                );
              },
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage())
          );
        }
        if(state is LoginError) {
          print('failure');
        }
        if(state is GoToRegisterPage) {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => RepositoryProvider.value(
                    value: RepositoryProvider.of<AppUserRepository>(context),
                    child: RegisterUserPage(),
                  )
              )
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 10, top: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 36, top: 20, right: 36, bottom: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5
                      )
                  )
              ),
              child: Text(
                'contact-app',
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 50
                ),
              ),
            ),
            _UsernameInput(),
            _PasswordInput(),
            _LoginButton(),
            _MessageSpace(),
            _RegisterButton(),
          ],
        ),),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'username',
              hintText: state.usernameHintText!,
              width: 200,
              labelTextColor: state.usernameLabelTextColor!,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginUsernameChanged(value));
              }
          );
        }
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return CustomTextFormWidget(
              labelText: 'password',
              hintText: state.passwordHintText!,
              width: 200,
              labelTextColor: state.passwordLabelTextColor!,
              obscureText: true,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginPasswordChanged(value));
              }
          );
        }
    );
  }
}

class _MessageSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is LoginLoading) {
            return Container(
              height: 20,
              child: LoadingFlipping.square(
                borderColor: Colors.green[900]!,
                size: 15,
              ),
            );
          } else if(state is LoginError) {
            return Container(
              height: 20,
              child: Text(
                'Wrong username or password',
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

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
                  context.read<LoginBloc>().add(SubmitLoginButton());
                },
                child: Text(
                    'Sign in',
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

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
                bottom: 5),
            height: 20,
            child: FlatButton(
                onPressed: () {
                  print('register');
                  context.read<LoginBloc>().add(SubmitSignOnButton());
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 15
                  ),
                )
            ),
          );
        }
    );
  }

}