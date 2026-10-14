import 'package:agreements/core/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences sharedPreferences;

  ThemeCubit({required this.sharedPreferences})
    : super(const ThemeState(darkTheme: false)) {
    _loadCurrentTheme();
  }

  void toggleTheme() {
    final newTheme = !state.darkTheme;
    sharedPreferences.setBool(AppConstants.THEME, newTheme);
    emit(state.copyWith(darkTheme: newTheme));
  }

  void _loadCurrentTheme() {
    final darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? false;
    emit(state.copyWith(darkTheme: darkTheme));
  }
}
