import 'package:get_it/get_it.dart';
import 'package:techn_app/features/home/data/datasources/home_datasources.dart';
import 'package:techn_app/features/home/data/repository/home_repository.dart';
import 'package:techn_app/features/home/domain/usecases/home_usecases.dart';
import 'package:techn_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:techn_app/features/login/data/datasources/login_datasources.dart';
import 'package:techn_app/features/login/data/network/login_datasources_impl.dart';
import 'package:techn_app/features/login/data/repository/login_repository.dart';
import 'package:techn_app/features/login/domain/usecases/login_usecases.dart';
import 'package:techn_app/features/login/presention/bloc/login_bloc.dart';

import 'features/home/data/network/home_datasources_impl.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));
  sl.registerFactory(() => LoginBloc(loginUseCases: sl()));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => HomeUseCases(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCases(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeDataRepository>(
      () => HomeDataRepositoryImpl(homeDataSources: sl()));
  sl.registerLazySingleton<LoginDataRepository>(
      () => LoginDataRepositoryImpl(loginDataSources: sl()));
  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<LoginDataSources>(() => LoginDataSourceImpl());
}
