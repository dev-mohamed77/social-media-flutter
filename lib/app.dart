import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/dependency_injection.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_post.dart';
import 'package:socailmedia/features/home/presintation/manager/cubit/home_cubit.dart';
import 'features/auth/domin/use_case/use_case_login.dart';
import 'features/auth/domin/use_case/use_case_register.dart';
import 'features/auth/persintation/manager/login_manager/cubit/login_cubit.dart';
import 'features/auth/persintation/manager/register_manager/cubit/register_cubit.dart';
import 'features/home/domain/use_case/home_usecase_fetch_stories.dart';
import 'features/splash/presentation/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            useCaseLogin: getIt<AuthUseCaseLogin>(),
          ),
          //  getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(
            authUsecaseRegister: getIt<AuthUsecaseRegister>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            repoPosts: getIt<UseCaseFetchPost>(),
            repoStories: getIt<UseCaseFetchStories>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Quicksand",
          scaffoldBackgroundColor: ConfigColor.kWhiteColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: ConfigColor.kWhiteColor,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
