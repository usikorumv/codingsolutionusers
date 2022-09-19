import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/get_users.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/components/user_card.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/cubit/users_cubit.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();

    context.read<UsersCubit>().fetchUsers(UsersParams());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const CircularProgressIndicator();
        }

        if (state is UsersFailure) {
          return const Icon(Icons.error);
        }

        if (state is UsersEmpty) {
          return const Text("There is no users in Firebase");
        }

        if (state is UsersSuccess) {
          final users = state.users.users;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) => UserCard(
              user: users[index],
            ),
            separatorBuilder: (context, __) => const SizedBox(height: 10),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
