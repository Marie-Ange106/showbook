// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
// import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showbook/account/business_logic/cubit/user_cubit.dart';
import 'package:showbook/account/data/user_repository.dart';
import 'package:showbook/comment/data/comment_repository.dart';
import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';
import 'package:showbook/location/business_logic/cubit/location_cubit.dart';
import 'package:showbook/location/data/location_repository.dart';

import 'auth/business_logic/cubit/auth_cubit.dart';
import 'auth/data/auth_repository.dart';
import 'category/business_logic/cubit/category_cubit.dart';
import 'category/data/repositories/category_repository.dart';
import 'comment/business_logic/cubit/comment_cubit.dart';
import 'event/business_logic/cubit/event_cubit.dart';
import 'event/data/repositories/event_repository.dart';
import 'profil/business_logic/cubit/profil_cubit.dart';
import 'profil/data/repositories/profil_repository.dart';
// import 'shared/connectivity/cubit/internet_cubit.dart';

final getIt = GetIt.instance;

Future setupLocator() async {
  getIt.registerLazySingletonAsync(
    () => SharedPreferences.getInstance(),
  );
  // var cacheDir = await getTemporaryDirectory();
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
    // baseUrl: 'https://nvxubcejz.preview.infomaniak.website',
    baseUrl: 'http://192.168.134.229:8000',
  ))
      // ..interceptors.add(DioCacheInterceptor(
      //   options: CacheOptions(
      //     store: HiveCacheStore(
      //       cacheDir.path,
      //       hiveBoxName: "showbook",
      //     ),
      //     policy: CachePolicy.refreshForceCache,
      //     hitCacheOnErrorExcept: [],
      //     maxStale: const Duration(
      //       days: 7,
      //     ), //increase number of days for loger cache
      //     priority: CachePriority.high,
      //   ),
      // )),
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

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerSingleton<LocationRepository>(
    LocationRepository(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<LocationCubit>(
    LocationCubit(
      location: getIt.get<LocationRepository>(),
    )..getLocation(),
  );

  getIt.registerSingleton<CommentRepository>(
    CommentRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<CommentCubit>(
    CommentCubit(
      comment: getIt.get<CommentRepository>(),
    ),
  );

  getIt.registerSingleton<UserRepository>(
    UserRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<UserCubit>(
    UserCubit(
      userRepository: getIt.get<UserRepository>(),
    ),
  );
  // Connectivity

  getIt.registerSingleton<FavoriteCubit>(
    FavoriteCubit(),
  );

  // getIt.registerSingleton<Connectivity>(
  //   Connectivity(),
  // );

  // getIt.registerSingleton<InternetCubit>(
  //   InternetCubit(
  //     connectivity: getIt.get<Connectivity>(),
  //   ),
  // );
}
