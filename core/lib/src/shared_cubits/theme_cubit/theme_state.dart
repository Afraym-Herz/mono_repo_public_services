import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool darkTheme;

  const ThemeState({required this.darkTheme});

  @override
  List<Object?> get props => [darkTheme];

  ThemeState copyWith({bool? darkTheme}) {
    return ThemeState(darkTheme: darkTheme ?? this.darkTheme);
  }
}
