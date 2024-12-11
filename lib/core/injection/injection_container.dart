import "package:chef_app/core/database/remote/api_consumer.dart";
import "package:chef_app/core/database/remote/dio_consumer.dart";
import "package:chef_app/features/auth/data/datasources/auth_remote.dart";
import "package:chef_app/features/auth/data/repositories/auth_repository_impl.dart";
import "package:chef_app/features/auth/domain/repositories/auth_repository.dart";
import "package:chef_app/features/auth/domain/usecases/login_usecases.dart";
import "package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart";
import "package:chef_app/network/network_info.dart";
import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";

final sl = GetIt.instance;
Future<void> init() async {
  //! Features - Global

  // sl.registerLazySingleton(() => CacheHelper().init());
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(sl()),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplemntes(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  //! Features - Global Finished

  //! Auth_Feature
  sl.registerLazySingleton(
    () => AuthCubit(sl()),
  );
  sl.registerLazySingleton(
    () => LoginUsecases(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(networkInfo: sl(), authRemote: sl()),
  );
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());

  //! End_Auth_Feature
}
