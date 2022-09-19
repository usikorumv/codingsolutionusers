import 'package:flutter/material.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/components/users_list.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Users:"),
            SizedBox(height: 15),
            UsersList(),
          ],
        ),
      ),
    );
  }
}
