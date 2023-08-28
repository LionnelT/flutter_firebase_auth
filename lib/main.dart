import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_auth/data/repositories/auth_repository.dart';
import 'package:flutter_firebase_auth/ui/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
        return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: const MaterialApp(
          home: SignIn()
        ),
      ),
    );

  }
}
