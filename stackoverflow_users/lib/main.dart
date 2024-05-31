import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'package:stackoverflow_users/router.dart';
import 'package:stackoverflow_users/src/core/providers/localization_cubit.dart';
import 'package:stackoverflow_users/src/core/providers/localization_provider.dart';
import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/di/sof_users_factory.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';

//Global dependency references
final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  // Initialize SharedPrefs instance.
  await SharedPrefs.init();

  runApp(const LocalizationProvider(
      child: SOFUsersApp(
    initialRoute: AppRoutes.usersListScreen,
  )));
}

class SOFUsersApp extends StatelessWidget {
  final String initialRoute;

  const SOFUsersApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          initialRoute: initialRoute,
          routes: okayRouter,
          title: 'SOF Users',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: AppTheme.appFont,
          ),
          locale: LocalizationProvider.of(context).locale,
        );
      }),
    );
  }
}

void initDependencies() {
  setupSOFUsersDependencies() ;
}
