import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/exports.dart';

///When app is in background this method will be call
@pragma('vm:entry-point')
Future<void> firebaseBackground(RemoteMessage message) async {
  DebugLog.i(
      "FCM Background Message : ${message.data} ${message.notification}");
  AwesomeNotificationManager.instance.showNotification(payload: message.data);
}

void main() {
  mainDelegate();
}

void mainDelegate() => AppInitializer.init(
      () async {
        setPathUrlStrategy();
        runApp(const SentryWidget(child: MyApp()));
      },
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit.instance,
        ),
        BlocProvider<ForceUpdateUnderMaintenanceCubit>(
          create: (context) => ForceUpdateUnderMaintenanceCubit.instance(),
        )
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(builder: (context, child) {
              configLoader();
              return child ?? const SizedBox();
            }),
            routerConfig: getIt<AppRouter>().config(
                navigatorObservers: () => [
                      CustomNavigationObserver(),
                      SentryNavigatorObserver(),
                    ]),
            title: 'Little Eats',
            locale: state.locale,
            supportedLocales: const [
              Locale(AppConstant.en, ''),
            ],
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: MyAppTheme.theme,
          );
        },
        buildWhen: (previous, current) => previous.locale != current.locale,
      ),
    );
  }

  void configLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: Dimens.timeDuration2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = Dimens.size40
      ..radius = Dimens.radius12
      ..progressWidth = Dimens.borderWidth4
      ..textColor = AppColors.whiteTextColor
      ..progressColor = AppColors.whiteBGColor
      ..backgroundColor = AppColors.blueBGColor
      ..indicatorColor = AppColors.whiteBGColor
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
