import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/presentation/pages/users/users_page.dart';

enum Routes {
  root("/"),

  home("/home"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_) => Routes.home.path,
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        // TODO: See
        builder: (_, __) => const UsersPage(),
      ),
    ],
    routerNeglect: true,
  );
}
