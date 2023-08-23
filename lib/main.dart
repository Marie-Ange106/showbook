import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/home/business_logic/cubit/category_cubit.dart';
import 'package:showbook/home/business_logic/cubit/event_cubit.dart';
import 'package:showbook/home/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'shared/routes/routes.dart';

void main() {
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
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
          useMaterial3: true,
        ),
        // home: const LoginScreen(),
      ),
    );
  }
}
