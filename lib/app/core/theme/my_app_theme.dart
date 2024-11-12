import '../../../utils/exports.dart';

abstract class MyAppTheme {
  static final ColorScheme appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    tertiary: AppColors.lightGrayBGColor,
    error: AppColors.redColor,
    onError: AppColors.redColor,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.redColor,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    outline: AppColors.lightGrayBGColor,
    shadow: AppColors.blackBGColor,
  );

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: getAppBarTheme(),
      primaryTextTheme: AppStyles.textTheme,
      colorScheme: appColorScheme,
      splashColor: appColorScheme.onPrimary.withOpacity(Dimens.opacity014),
      indicatorColor: appColorScheme.surface,
      iconTheme: IconThemeData(color: appColorScheme.onSurface),
      scaffoldBackgroundColor: appColorScheme.surface,
      buttonTheme: getButtonTheme(),
      textButtonTheme: getTextButtonThemeData(),
      elevatedButtonTheme: getElevatedButtonThemeData(),
      outlinedButtonTheme: getOutlinedButtonThemeData(),
      floatingActionButtonTheme: getFloatingActionButtonThemeData(),
      textTheme: AppStyles.textTheme,
      inputDecorationTheme: getInputDecorationTheme(),
      cardTheme: getCardTheme(),
      dialogTheme: getDialogTheme(),
      bottomSheetTheme: getBottomSheetThemeData(),
      bottomNavigationBarTheme: getBottomNavigationBarThemeData(),
      dividerColor: appColorScheme.outline,
      drawerTheme: getDrawerThemeData(),
      tabBarTheme: getTabBarTheme(),
      switchTheme: getSwitchThemeData(),
      snackBarTheme: getSnackBarThemeData(),
      radioTheme: getRadioThemeData(),
      progressIndicatorTheme: getProgressIndicatorThemeData(),
      popupMenuTheme: getPopupMenuThemeData(),
      useMaterial3: true,
    );
  }

  static AppBarTheme getAppBarTheme() {
    return AppBarTheme(
      color: appColorScheme.primary,
      centerTitle: true,
      actionsIconTheme:
          IconThemeData(color: appColorScheme.onPrimary, size: Dimens.size25),
      shadowColor: AppColors.lightGrayBGColor,
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.lightGrayBGColor,
        ),
      ),
      iconTheme: IconThemeData(color: appColorScheme.onPrimary),
      titleTextStyle: AppStyles.textTheme.titleLarge?.copyWith(
          fontSize: Dimens.fontSize20, color: appColorScheme.primary),
      systemOverlayStyle: systemOverlay(),
    );
  }

  static systemOverlay() {
    return SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: appColorScheme.onPrimary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: appColorScheme.onPrimary,
      systemNavigationBarDividerColor: appColorScheme.surface,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  static ButtonThemeData getButtonTheme() {
    return ButtonThemeData(
        buttonColor: appColorScheme.primary,
        disabledColor: appColorScheme.outline,
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding10, horizontal: Dimens.padding20),
        colorScheme: appColorScheme,
        textTheme: ButtonTextTheme.primary,
        splashColor: appColorScheme.onPrimary.withOpacity(Dimens.opacity014),
        shape: RoundedRectangleBorder(
          borderRadius: Dimens.radius10.borderRadius,
          side: Dimens.borderWidth3.borderSide(
            color: appColorScheme.primary,
            style: BorderStyle.solid,
          ),
        ));
  }

  static TextButtonThemeData getTextButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return appColorScheme.primary.withOpacity(Dimens.opacity014);
            }

            return null;
          },
        ),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColorScheme.tertiary;
          }
          return appColorScheme.surface;
        }),
        // Setting textStyle for text of button
        textStyle: WidgetStatePropertyAll(
          AppStyles.textTheme.titleLarge?.copyWith(
              fontSize: Dimens.fontSize20, color: appColorScheme.surface),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radius6.borderRadius,
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return appColorScheme.outline;
            }
            return null;
          },
        ),
      ),
    );
  }

  static ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return appColorScheme.onPrimary.withOpacity(Dimens.opacity014);
            }
            return null;
          },
        ),
        shadowColor: WidgetStatePropertyAll(
          appColorScheme.shadow,
        ),

        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return appColorScheme.tertiary;
            }
            return null;
          },
        ),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColorScheme.tertiary;
          }
          return appColorScheme.surface;
        }),
        textStyle: WidgetStatePropertyAll(
          AppStyles.textTheme.titleLarge?.copyWith(
              fontSize: Dimens.fontSize20, color: appColorScheme.surface),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(
              left: Dimens.padding36,
              right: Dimens.padding36,
              top: Dimens.padding18,
              bottom: Dimens.padding18),
        ),
        side: WidgetStatePropertyAll(
          (Dimens.borderWidth05).borderSide(
            color: AppColors.lightGrayBGColor,
            style: BorderStyle.solid,
            strokeAlign: Dimens.borderWidth1,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radius6.borderRadius,
          ),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData getOutlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return appColorScheme.primary.withOpacity(Dimens.opacity014);
            }
            return null;
          },
        ),
        backgroundColor: WidgetStatePropertyAll(
          appColorScheme.surface,
        ),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColorScheme.tertiary;
          }
          return appColorScheme.surface;
        }),
        textStyle: WidgetStatePropertyAll(
          AppStyles.textTheme.titleLarge?.copyWith(
              fontSize: Dimens.fontSize20, color: appColorScheme.surface),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
            horizontal: Dimens.padding30, vertical: Dimens.padding10)),
        side: WidgetStatePropertyAll(
          Dimens.borderWidth1.borderSide(
            color: appColorScheme.surface,
            style: BorderStyle.solid,
            strokeAlign: Dimens.borderWidth1,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: Dimens.radius27.borderRadius,
          ),
        ),
      ),
    );
  }

  static FloatingActionButtonThemeData getFloatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      elevation: Dimens.space4,
      backgroundColor: appColorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: Dimens.radius20.borderRadius),
      disabledElevation: Dimens.zero,
      extendedIconLabelSpacing: Dimens.space20,
      splashColor: appColorScheme.primary.withOpacity(Dimens.opacity014),
    );
  }

  static InputDecorationTheme getInputDecorationTheme() {
    return InputDecorationTheme(
      isCollapsed: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.padding10),
      hintStyle: AppStyles.textTheme.labelSmall
          ?.copyWith(color: AppColors.lightGrayTextColor),
      labelStyle: AppStyles.textTheme.bodyMedium,
      hoverColor: Colors.transparent,
      errorStyle: AppStyles.errorStyle.copyWith(fontSize: Dimens.fontSize12),
      alignLabelWithHint: true,
      errorMaxLines: Dimens.maxLines03,
      isDense: false,
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return AppStyles.errorStyle;
        }
        if (states.contains(WidgetState.focused)) {
          return AppStyles.hintStyle.copyWith(color: AppColors.blueColor);
        }
        return AppStyles.hintStyle;
      }),
      border: Dimens.radius4.outlineInputBorder(
        borderSide:
            Dimens.borderWidth1.borderSide(color: AppColors.inActiveGrayColor),
      ),
      enabledBorder: Dimens.radius4.outlineInputBorder(
        borderSide:
            Dimens.borderWidth1.borderSide(color: AppColors.inActiveGrayColor),
      ),
      focusedBorder: Dimens.radius4.outlineInputBorder(
        borderSide: Dimens.borderWidth1.borderSide(color: AppColors.redColor),
      ),
      errorBorder: Dimens.radius4.outlineInputBorder(
        borderSide: Dimens.borderWidth1.borderSide(color: appColorScheme.error),
      ),
      focusedErrorBorder: Dimens.radius4.outlineInputBorder(
        borderSide: Dimens.borderWidth1.borderSide(color: appColorScheme.error),
      ),
      disabledBorder: Dimens.radius4.outlineInputBorder(
        borderSide: Dimens.borderWidth1
            .borderSide(color: appColorScheme.outline.withOpacity(0.5)),
      ),
    );
  }

  static CardTheme getCardTheme() {
    return CardTheme(
      color: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: Dimens.radius10.borderRadius,
      ),
      shadowColor: AppColors.transparent,
      elevation: Dimens.space4,
    );
  }

  static DialogTheme getDialogTheme() {
    return DialogTheme(
      backgroundColor: appColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Dimens.radius20.borderRadius,
      ),
      elevation: Dimens.space4,
      titleTextStyle: AppStyles.textTheme.titleLarge
          ?.copyWith(color: appColorScheme.onSurface),
      contentTextStyle: AppStyles.textTheme.bodyMedium?.copyWith(
        color: appColorScheme.onSurface,
      ),
    );
  }

  static BottomSheetThemeData getBottomSheetThemeData() {
    return BottomSheetThemeData(
      backgroundColor: appColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Dimens.radius24.circularRadius,
          topRight: Dimens.radius24.circularRadius,
        ),
      ),
      modalBackgroundColor: appColorScheme.surface,
      elevation: Dimens.space4,
      modalElevation: Dimens.space4,
    );
  }

  static BottomNavigationBarThemeData getBottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      elevation: Dimens.space4,
      backgroundColor: appColorScheme.surface,
      selectedIconTheme:
          IconThemeData(color: appColorScheme.surface, size: Dimens.size28),
      selectedItemColor: appColorScheme.surface,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(color: appColorScheme.tertiary),
      unselectedItemColor: appColorScheme.tertiary,
      selectedLabelStyle:
          AppStyles.textTheme.bodyMedium?.copyWith(fontSize: Dimens.fontSize12),
      unselectedLabelStyle:
          AppStyles.textTheme.bodyMedium?.copyWith(fontSize: Dimens.fontSize12),
    );
  }

  static DrawerThemeData getDrawerThemeData() {
    return DrawerThemeData(
      backgroundColor: appColorScheme.surface,
    );
  }

  static TabBarTheme getTabBarTheme() {
    return TabBarTheme(
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return appColorScheme.surface.withOpacity(Dimens.opacity014);
          }
          return null;
        },
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(
          vertical: Dimens.padding6, horizontal: Dimens.padding10),
      labelColor: appColorScheme.surface,
      unselectedLabelColor: appColorScheme.tertiary,
      labelStyle:
          AppStyles.textTheme.bodyMedium?.copyWith(fontSize: Dimens.fontSize20),
      unselectedLabelStyle:
          AppStyles.textTheme.bodyMedium?.copyWith(fontSize: Dimens.fontSize20),
    );
  }

  static SwitchThemeData getSwitchThemeData() {
    return SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(appColorScheme.surface),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected) ||
              states.contains(WidgetState.pressed)) {
            return appColorScheme.surface;
          }
          return appColorScheme.tertiary;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return appColorScheme.surface.withOpacity(Dimens.opacity014);
          }
          return null;
        },
      ),
      splashRadius: Dimens.radius10,
    );
  }

  static SnackBarThemeData getSnackBarThemeData() {
    return SnackBarThemeData(
      shape: RoundedRectangleBorder(borderRadius: Dimens.radius6.borderRadius),
      backgroundColor: appColorScheme.onSurface,
      actionTextColor: appColorScheme.surface,
      contentTextStyle: AppStyles.textTheme.bodyMedium
          ?.copyWith(color: appColorScheme.surface),
    );
  }

  static RadioThemeData getRadioThemeData() {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        return appColorScheme.primary;
      }),
      splashRadius: Dimens.radius10,
    );
  }

  static ProgressIndicatorThemeData getProgressIndicatorThemeData() {
    return ProgressIndicatorThemeData(
      circularTrackColor: Colors.transparent,
      color: appColorScheme.tertiary,
      linearMinHeight: Dimens.space2,
      linearTrackColor: Colors.transparent,
    );
  }

  static PopupMenuThemeData getPopupMenuThemeData() {
    return PopupMenuThemeData(
        color: appColorScheme.surface,
        elevation: Dimens.space4,
        shape:
            RoundedRectangleBorder(borderRadius: Dimens.radius10.borderRadius),
        textStyle: AppStyles.textTheme.bodySmall);
  }
}
