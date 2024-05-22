// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/get_user.dart';
import 'features/user/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => UserBloc(getUser: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
