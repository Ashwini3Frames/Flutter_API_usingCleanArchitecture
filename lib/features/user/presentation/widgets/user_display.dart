// lib/features/user/presentation/widgets/user_display.dart
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class UserDisplay extends StatelessWidget {
  final User user;

  const UserDisplay({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(user.email),
        // Add other user fields here
        SizedBox(height: 20),
      ],
    );
  }
}
