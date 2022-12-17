import 'dart:io' show File, Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techn_app/features/home/presentation/pages/home_page.dart';
import 'package:techn_app/features/login/presentation/pages/login_pages.dart';
import 'package:techn_app/features/onbording/presentation/pages/onbording_page.dart';
import 'package:techn_app/features/process/presentation/pages/process_page.dart';
import 'package:techn_app/features/repair/presentation/pages/repair_page.dart';
import 'package:techn_app/features/starting/presentation/pages/starting.dart';
import 'package:techn_app/features/technical/presentation/pages/technical_page.dart';
import 'package:techn_app/features/techprocesses/presentation/pages/techprocesses.dart';

// ignore_for_file: constant_identifier_names
enum Routes {
  HOME,
  LOGIN,
  REPAIR,
  PROCESS,
  TECHNICAL,
  TECHPROCESSES,
}

class _Paths {
  static const String init = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String repair = '/repair';
  static const String process = '/process';
  static const String technical = '/technical';
  static const String techprocesses = '/techprocesses';

  static const Map<Routes, String> _pathMap = {
    Routes.HOME: _Paths.home,
    Routes.LOGIN: _Paths.login,
    Routes.REPAIR: _Paths.repair,
    Routes.PROCESS: _Paths.process,
    Routes.TECHNICAL: _Paths.technical,
    Routes.TECHPROCESSES: _Paths.techprocesses,
  };

  static String? of(Routes route) => _pathMap[route];
}

String? _currentRoute;

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static String? getCurrentRoute() {
    return _currentRoute;
  }

  static String? getNameByRoute(Routes route) {
    return _Paths.of(route);
  }

  static Route onGenerateRoute(RouteSettings settings) {
    Route pageRoute({Widget page = const Starting()}) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page);
    }

    _currentRoute = settings.name;

    switch (settings.name) {
      case _Paths.init:
        return pageRoute(page: const OnbordingPage());
      case _Paths.login:
        return pageRoute(page: const LoginPages());
      case _Paths.home:
        return pageRoute(page: const HomePage());
      case _Paths.repair:
        return pageRoute(page: const RepairPage());
      case _Paths.process:
        return pageRoute(page: const ProcessPage());
      case _Paths.technical:
        return pageRoute(page: const TechnicalPage());
      case _Paths.techprocesses:
        return pageRoute(page: const TechProcessesPage());
      default:
        return pageRoute(page: const Starting());
    }
  }

  static Future push<T>(Routes route, [T? arguments]) =>
      state.pushNamed(_Paths.of(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, [T? arguments]) =>
      state.pushNamedAndRemoveUntil(
        _Paths.of(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future replaceWith<T>(Routes route, [T? arguments]) =>
      state.pushReplacementNamed(_Paths.of(route)!, arguments: arguments);

  static void pop() => state.pop();

  static void popWithResult<T>(T res) => state.pop(res);

  static NavigatorState get state => navigatorKey.currentState!;
}
