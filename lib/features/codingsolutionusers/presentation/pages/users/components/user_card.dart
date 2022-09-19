import 'package:flutter/material.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.email ?? "Email"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.name ?? "Name"),
          Text(user.surname ?? "Surname"),
          Text(user.referer ?? "Referer"),
          Text(user.phone ?? "Phone"),
          Text(user.date ?? "Date"),
        ],
      ),
    );
  }
}
