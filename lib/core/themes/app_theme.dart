part of '_themes.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.compact,
      listTileTheme: const ListTileThemeData(dense: true),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BaseColors.furina3,
        selectionColor: BaseColors.furina3.withOpacity(0.5),
        selectionHandleColor: BaseColors.furina3.withOpacity(0.5),
      ),
    );
  }
}
