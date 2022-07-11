part of 'theme_cubit.dart';

class ThemeState {
  bool isDark = SharedPrefs.getBool('isDark') ?? false;
  ThemeState({required this.isDark});

  ThemeState copyWith(bool? isDark) {
    return ThemeState(isDark: isDark ?? this.isDark);
  }
}
