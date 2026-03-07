import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:ticket_system/core/provider/data_provider.dart';

import '../../feature/auth/data/datasources/auth_remote_datasourse.dart';
import '../../feature/auth/data/repositoryImpl/auth_repository_impl.dart';
import '../../feature/auth/domain/repository/auth_repository.dart';
import '../../feature/auth/domain/usecase/login_usecase.dart';
import '../../feature/auth/presentation/viewmodel/auth_view_model.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // 1. External (Dio)
  sl.registerLazySingleton(() => Dio());

  // 2. Core (DioHelper)
  sl.registerLazySingleton(() => DataProvider(sl()));

  // 3. Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(dataProvider: sl()),
  );

  // 4. Repositories
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // 5. Use Cases (If you have a LoginUseCase class)
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // 6. ViewModels (Factory: creates a new instance each time it's called)
  sl.registerFactory(() => AuthViewModel(sl()));
}