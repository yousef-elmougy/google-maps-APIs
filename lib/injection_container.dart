

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maps/core/api/api_consumer.dart';
import 'package:maps/presentation/map_bloc/map_cubit.dart';
import 'core/api/api_interceptor.dart';
import 'core/api/dio_consumer.dart';
import 'data/data_source/remote_data_source.dart';
import 'data/repository/repository.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// FEATURES
  // BLOC
  sl.registerFactory(() => MapCubit(repository: sl()));
  // REPOSITORY
sl.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: sl()));
  // DATA SOURCE
// LOCAL DATA SOURCE

  // REMOTE DATA SOURCE
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(apiConsumer: sl()));
  /// CORE
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  /// EXTERNAL
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
}
