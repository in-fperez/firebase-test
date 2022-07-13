import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_testv2/config/shared_preferences.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: false));

  bool get isDark => state.isDark;

  void changeTheme() {
    SharedPrefs.setBool('isDark', !state.isDark);
    emit(state.copyWith(!state.isDark));
  }
}
