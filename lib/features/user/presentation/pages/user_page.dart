// lib/features/user/presentation/pages/user_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_api/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter_api/features/user/presentation/widgets/user_display.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is Empty) {
            return Center(child: Text('No Data'));
          } else if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return UserDisplay(user: state.user);
          } else if (state is Error) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
