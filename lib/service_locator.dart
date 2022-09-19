import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/cubit/users_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/data/datasources/remote/auth_remote_data_sources.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/data/repositories/auth_repository_impl.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_user_info.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/get_users.dart';

final sl = GetIt.instance;

init() {
  dataSources();
  repositories();
  useCase();
  cubit();
}

// void initPreferencesManager(SharedPreferences initPreferencesManager) {
//   sl.registerLazySingleton<AuthLocalDataSource>(
//       () => AuthLocalDataSourceImpl(preferences: initPreferencesManager));
// }

void dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => FirebaseAuthRemoteDatasourceImpl(),
  );
}

void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

void useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => PostUserInfo(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
}

void cubit() {
  sl.registerFactory(() => UsersCubit(sl()));
}
