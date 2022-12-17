import 'package:get_it/get_it.dart';
import 'package:techn_app/core/bloc/global_bloc.dart';
import 'package:techn_app/features/home/data/datasources/home_datasources.dart';
import 'package:techn_app/features/home/data/repository/home_repository.dart';
import 'package:techn_app/features/home/domain/usecases/home_usecases.dart';
import 'package:techn_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:techn_app/features/login/data/datasources/login_datasources.dart';
import 'package:techn_app/features/login/data/network/login_datasources_impl.dart';
import 'package:techn_app/features/login/data/repository/login_repository.dart';
import 'package:techn_app/features/login/domain/usecases/login_usecases.dart';
import 'package:techn_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:techn_app/features/onbording/data/datasources/user_firebase_datasource.dart';
import 'package:techn_app/features/onbording/data/network/user_firebase_datasource_impl.dart';
import 'package:techn_app/features/onbording/data/repositories/user_firebase_repository.dart';
import 'package:techn_app/features/onbording/domain/usecases/user_firebase_usecases.dart';
import 'package:techn_app/features/repair/data/datasource/repair_datasource.dart';
import 'package:techn_app/features/repair/data/nerwork/repair_datasource_impl.dart';
import 'package:techn_app/features/repair/data/repositories/repair_repository.dart';
import 'package:techn_app/features/repair/domain/usecases/repair_usecases.dart';
import 'package:techn_app/features/repair/presentation/bloc/repair_bloc.dart';

import 'features/home/data/network/home_datasources_impl.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => GlobalBloc(userFirebaseUseCases: sl()));
  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));
  sl.registerFactory(() => LoginBloc(loginUseCases: sl()));
  sl.registerFactory(() => RepairBloc(repairUseCases: sl()));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => HomeUseCases(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCases(repository: sl()));
  sl.registerLazySingleton(() => UserFirebaseUseCases(repository: sl()));
  sl.registerLazySingleton(() => RepairUseCases(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeDataRepository>(
      () => HomeDataRepositoryImpl(homeDataSources: sl()));
  sl.registerLazySingleton<LoginDataRepository>(
      () => LoginDataRepositoryImpl(loginDataSources: sl()));
  sl.registerLazySingleton<UserFirebaseRepository>(
      () => UserFirebaseRepositoryImpl(userFirebaseSources: sl()));
  sl.registerLazySingleton<RepairRepository>(
      () => RepairRepositoryImpl(repairDatasource: sl()));
  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<LoginDataSources>(() => LoginDataSourceImpl());
  sl.registerLazySingleton<UserFirebaseDataSource>(
      () => UserFirebaseDataSourceImpl());
  sl.registerLazySingleton<RepairDatasource>(() => RepairDatasourceImpl());
}
