import 'package:bloc/bloc.dart';
import 'package:firebase_testv2/config/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = SharedPrefs.getBool('isDark') ?? false;
  bool get isDark => _isDark;

  void changeTheme() {
    _isDark = !_isDark;
    SharedPrefs.setBool('isDark', true);
    emit(ThemeChanged());
  }
}
