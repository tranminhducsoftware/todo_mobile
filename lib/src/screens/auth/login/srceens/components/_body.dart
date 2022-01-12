import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/screens/auth/login/bloc/login_bloc.dart';
import 'package:todo_mobile/src/screens/splash/bloc/splash_bloc.dart';

import '_form.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IAccountRepository _accountRepository =
    GetIt.I.get<IAccountRepository>();
    final splashBloc = BlocProvider.of<SplashBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(splashBloc),
        child: SignInForm(),
      ),
    );
  }
}