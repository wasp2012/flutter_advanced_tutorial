import 'package:dio/dio.dart';
import 'package:flutter_advanced_tutorial/core/networking/api_service.dart';
import 'package:flutter_advanced_tutorial/core/networking/dio_factory.dart';
import 'package:flutter_advanced_tutorial/feature/login/data/repos/logo_repo.dart';
import 'package:flutter_advanced_tutorial/feature/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio $ ApiService

  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login 
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
