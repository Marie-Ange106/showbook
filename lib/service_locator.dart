import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:showbook/home/business_logic/cubit/category_cubit.dart';
import 'package:showbook/home/business_logic/cubit/event_cubit.dart';
import 'package:showbook/home/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/home/data/repositories/category_repository.dart';
import 'package:showbook/home/data/repositories/profil_repository.dart';

import 'home/data/repositories/event_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: 'http://192.168.149.229:8000',
    )),
  );

  getIt.registerSingleton<EventRepository>(
    EventRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<EventCubit>(
    EventCubit(
      eventRepository: getIt.get<EventRepository>(),
    )..getEvent(),
  );

  getIt.registerSingleton<CategoryRepository>(
    CategoryRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<CategoryCubit>(
    CategoryCubit(
      categoryRepository: getIt.get<CategoryRepository>(),
    )..getCategory(),
  );

  getIt.registerSingleton<ProfilRepository>(
    ProfilRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<ProfilCubit>(
    ProfilCubit(
      profilRepository: getIt.get<ProfilRepository>(),
    )..getProfil(),
  );
}
