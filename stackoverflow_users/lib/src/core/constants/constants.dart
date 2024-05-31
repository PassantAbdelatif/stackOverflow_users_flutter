class Constants {
  static KeysConstants get keys => KeysConstants();
  static APIsConstants get apis => APIsConstants();
  static APISHeaderConstants get headers => APISHeaderConstants();
  static LanguageConstants get locale => LanguageConstants();
  static ConstantsValues get constants => ConstantsValues();
}

class KeysConstants {
  String get page => "page";
  String get pagesize => "pagesize";
  String get site => "site";
  String get stackoverflow => "stackoverflow";
  String get locale => "locale";
  String get user => "user";
  String get userIds => "userIds";
  String get bookmarkedUsers => "bookmarkedUsers";
}

class APIsConstants {
  String get baseURL => "https://api.stackexchange.com/2.2/";
  String get sofUsersRequest => "users";
  String get reputationHistoryRequest => "reputation-history";
}

class APISHeaderConstants {
  String get accept => "Accept";
  String get acceptLanguage => "Accept-Language";
  String get acceptValue => "application/json;charset=utf-t";
}

class ConstantsValues {
  int get pageSize => 30;
}

class LanguageConstants {
  String get en => "en";
  String get ar => "ar";
}

const String SERVER_DATE_FULL_FORMAT = "yyyy-MM-ddTHH:mm:ss.SSS";
