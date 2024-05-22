// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'features/user/presentation/pages/user_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => di.sl<UserBloc>()..add(GetUserEvent(3)),
        child: UserPage(),
      ),
    );
  }
}
