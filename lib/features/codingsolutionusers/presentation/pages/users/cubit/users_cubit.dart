import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/get_users.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUser) : super(UsersInitial());
  final GetUsers _getUser;

  Future<void> fetchUsers(UsersParams userParams) async {
    /// Only show loading in 1 page
    await _fetchData(userParams);
  }

  // Future<void> refreshUsers(UsersParams usersParams) async {
  //   await _fetchData(usersParams);
  // }

  Future<void> _fetchData(UsersParams usersParams) async {
    if (usersParams.page == 1) {
      emit(UsersLoading());
    }

    final data = await _getUser.call(usersParams);
    
    data.fold((l) {
      if (l is ServerFailure) {
        emit(UsersFailure(l.message!));
      } else if (l is NoDataFailure) {
        emit(UsersEmpty());
      }
    }, (r) {
      emit(UsersSuccess(r));
    });
  }
}
