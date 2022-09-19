import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/presentation/app_route.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/users_page.dart';
import 'package:codingsolutionusers/firebase_options.dart';
import 'package:codingsolutionusers/service_locator.dart';

// TODO: See
import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/cubit/users_cubit.dart';

void main() async {
  init();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(
    () => SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then(
      (_) async {
        runApp(const Application());
      },
    ),
    (error, stackTrace) async {
      // TODO: See
    },
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UsersCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            AppRoute.setStream(context);

            return const MaterialApp(
              title: "Coding Solution",
              debugShowCheckedModeBanner: false,
              home: UsersPage(),
            );

            // TODO: See
            return MaterialApp.router(
              title: "Coding Solution",
              debugShowCheckedModeBanner: false,
              routeInformationProvider:
                  AppRoute.router.routeInformationProvider,
              routeInformationParser: AppRoute.router.routeInformationParser,
              routerDelegate: AppRoute.router.routerDelegate,
              builder: (context, child) {
                final MediaQueryData data = MediaQuery.of(context);

                return MediaQuery(
                  data: data.copyWith(
                    textScaleFactor: 1,
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
