import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'dart:async';

import '../constants/constants.dart';

class SharedPrefs extends ChangeNotifier {
  static late final SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async =>
      _prefsInstance = await SharedPreferences.getInstance();

  bool getBool(String key, [bool elseValue = false]) {
    return _prefsInstance.getBool(key) ?? elseValue;
  }

  static Future<bool> setBool(String key, bool value) async {
    return _prefsInstance.setBool(key, value) ?? Future.value(false);
  }

  static Locale getLocale() {
    AppLanguage.languageCode =
        _prefsInstance.getString(Constants.keys.locale) ?? Constants.locale.en;
    return Locale(
        _prefsInstance.getString(Constants.keys.locale) ?? Constants.locale.en);
  }

  static Future<void> saveLocale(Locale locale) async {
    AppLanguage.languageCode = locale.languageCode;
    await _prefsInstance.setString(Constants.keys.locale, locale.languageCode);
  }

  static Future<void> bookmarkUserId(int userId) async {
    // fetch your saved user ids string list
    List<String> savedUserIdsStringValues =
        (_prefsInstance.getStringList(Constants.keys.userIds) ?? []);
    // add your unbookmarked userId to saved user ids string list
    savedUserIdsStringValues.add("$userId");
    //then save the updated list
    await _prefsInstance.setStringList(
        Constants.keys.userIds, savedUserIdsStringValues);
  }

  static Future<void> unBookmarkUserId(int userId) async {
    // fetch your saved user ids string list
    List<String> savedUserIdsStringValues =
        (_prefsInstance.getStringList(Constants.keys.userIds) ?? []);
    // remove your bookmarked userId to saved user ids string list
    savedUserIdsStringValues.removeWhere((item) => item == '$userId');
    //then save the updated list
    await _prefsInstance.setStringList(
        Constants.keys.userIds, savedUserIdsStringValues);
  }

  static Future<bool> checkIfUserIdBookmarked(int userId) async {
    // fetch your saved user ids string list
    List<String> savedUserIdsStringValues =
        (_prefsInstance.getStringList(Constants.keys.userIds) ?? []);

    return savedUserIdsStringValues.contains("$userId");
  }

  static Future<List<String>> getBookmaredList() async {
    // fetch your saved user ids string list
    List<String> savedUserIdsStringValues =
        (_prefsInstance.getStringList(Constants.keys.userIds) ?? []);

    return savedUserIdsStringValues;
  }

  static Future<void> saveBookmaredList(List<String> userIds) async {
    await _prefsInstance.setStringList(Constants.keys.userIds, userIds);
  }
}
