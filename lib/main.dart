import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/account/business_logic/cubit/user_cubit.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/category/business_logic/cubit/category_cubit.dart';
import 'package:showbook/comment/business_logic/cubit/comment_cubit.dart';
import 'package:showbook/event/business_logic/cubit/event_cubit.dart';
import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';
import 'package:showbook/location/business_logic/cubit/location_cubit.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'shared/connectivity/cubit/internet_cubit.dart';
import 'shared/routes/routes.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventCubit>(
          create: (context) => getIt.get<EventCubit>(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => getIt.get<CategoryCubit>()..getCategory(),
        ),
        BlocProvider<ProfilCubit>(
          create: (context) => getIt.get<ProfilCubit>()..getProfil(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => getIt.get<AuthCubit>()..getUser(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => getIt.get<LocationCubit>()..getLocation(),
        ),
        BlocProvider<CommentCubit>(
          create: (context) => getIt.get<CommentCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => getIt.get<UserCubit>(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => getIt.get<FavoriteCubit>(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => getIt.get<InternetCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
          useMaterial3: true,
        ),
        // builder: (context, child) {
        //   return BlocListener<InternetCubit, InternetState>(
        //     listener: (context, state) {
        //       if (state.disconnected) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(
        //             content: Text(
        //               'No internet',
        //             ),
        //           ),
        //         );
        //       }
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(
        //           content: Text(
        //             'No internet',
        //           ),
        //         ),
        //       );
        //     },
        //     child: Container(),
        //   );
        // }
      ),
    );
  }
}
