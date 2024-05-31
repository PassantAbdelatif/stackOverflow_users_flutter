import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_users/gen/fonts.gen.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';

import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(SharedPrefs.getLocale());

  Future<void> changeAppLanguage(Locale locale) async {
    await SharedPrefs.saveLocale(locale);
    AppTheme.appFont = locale.languageCode == Constants.locale.en
        ? FontFamily.poppins
        : FontFamily.ge;
    emit(locale);
  }
}
