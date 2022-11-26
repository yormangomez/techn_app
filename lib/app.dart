import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:techn_app/features/login/presention/bloc/login_bloc.dart';
import 'package:techn_app/flavor.dart';
import 'package:techn_app/navigator.dart';

import 'injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<HomeBloc>()),
          BlocProvider(create: (context) => di.sl<LoginBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner:
                Flavor.instance.value == FlavorType.DEV ? true : false,
            title: 'test clean arquitectur',
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.onGenerateRoute),
      ),
    );
  }
}
