import "package:chef_app/core/cubits/cubit/bootom_navbar_cubit.dart";
import "package:chef_app/core/database/remote/api_consumer.dart";
import "package:chef_app/core/database/remote/dio_consumer.dart";
import "package:chef_app/features/auth/data/datasources/auth_remote.dart";
import "package:chef_app/features/auth/data/repositories/auth_repository_impl.dart";
import "package:chef_app/features/auth/domain/repositories/auth_repository.dart";
import "package:chef_app/features/auth/domain/usecases/send_code_usecase.dart";
import "package:chef_app/features/auth/domain/usecases/login_usecase.dart";
import "package:chef_app/features/auth/domain/usecases/register_usecase.dart";
import "package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart";
import "package:chef_app/core/network/network_info.dart";
import "package:chef_app/features/auth/presentation/cubits/register/register_cubit.dart";
import "package:chef_app/features/profile/data/datasources/chef_data_remote.dart";
import "package:chef_app/features/profile/data/repositories/profile_repository_impl.dart";
import "package:chef_app/features/profile/domain/repositories/profile_repository.dart";
import "package:chef_app/features/profile/domain/usecases/change_password_profile_usecase.dart";
import "package:chef_app/features/profile/domain/usecases/edit_profile_usecase.dart";
import "package:chef_app/features/profile/domain/usecases/get_chef_data_usecase.dart";
import "package:chef_app/features/profile/presentation/cubit/profile/profile_cubit.dart";
import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";

final sl = GetIt.instance;
Future<void> init() async {
  //!============ cubits
  sl.registerFactory(
    () => AuthCubit(
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerFactory(
    () => RegisterCubit(
      sl(),
    ),
  );
  sl.registerFactory(
    () => BootomNavbarCubit(),
  );
  sl.registerFactory(
    () => ProfileCubit(
      changepasswordUseCase: sl(),
      editProfileUseCase: sl(),
      getChefUseCase: sl(),
    ),
  );
  //!============ Features - Global

  // sl.registerLazySingleton(() => CacheHelper().init());
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(sl()),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplemntes(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());

  //!============ Auth_Feature

  sl.registerLazySingleton(
    () => LoginUsecase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RegisterUsecase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SendCodeUsecase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemote: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());

  //!============ start_profile_Feature

  sl.registerLazySingleton(
    () => GetChefDataUsecase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      networkInfo: sl(),
      remoteData: sl(),
    ),
  );
  sl.registerLazySingleton<ChefDataRemote>(
    () => ChefDataRemoteImpl(),
  );
//? ========= edit profile
  sl.registerLazySingleton(
    () => EditProfileUsecase(repository: sl()),
  );
//?==========
  sl.registerLazySingleton(
    () => ChangePasswordProfileUsecase(repository: sl()),
  );
  //!============ End_profile_Feature
}
