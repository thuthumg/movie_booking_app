class EnvironmentConfig{
  static const String CONFIG_THEME_COLOR =
  String.fromEnvironment("CONFIG_THEME_COLOR",defaultValue: "MOVIE_BOOKING_APP_THEME");
  static const String CONFIG_MOVIE_DETAIL_ACTORS_UI =
  String.fromEnvironment("CONFIG_MOVIE_DETAIL_ACTORS_UI",defaultValue: "ACTOR_UI_WITH_LIST_VIEW");
}

///FLAVORS

///THEME 1(Original UI)
///flutter run --dart-define=CONFIG_THEME_COLOR=MOVIE_BOOKING_APP_THEME --dart-define=CONFIG_MOVIE_DETAIL_ACTORS_UI=ACTOR_UI_WITH_LIST_VIEW

/// THEME 2(Change UI)
///flutter run --dart-define=CONFIG_THEME_COLOR=MOVIE_APP_THEME --dart-define=CONFIG_MOVIE_DETAIL_ACTORS_UI=ACTOR_UI_WITH_WRAP_VIEW