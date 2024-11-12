import '../../utils/exports.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            page: SplashRoute.page,
            maintainState: false,
            initial: true,
            path: AppPaths.onboarding,
            transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
            page: OnBoardingRoute.page,
            maintainState: false,
            initial: false,
            path: AppPaths.onboarding,
            transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
            page: NewUserQuestionnairesRoute.page,
            maintainState: false,
            initial: false,
            path: AppPaths.newUserQuestionnaires,
            transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
            page: LoginRoute.page,
            maintainState: false,
            initial: false,
            path: AppPaths.login,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
          page: ForgotPasswordRoute.page,
          maintainState: false,
          initial: false,
          path: AppPaths.forgotPassword,
        ),
        CustomRoute(
          page: VerifyEmailRoute.page,
          maintainState: false,
          initial: false,
          path: AppPaths.verifyEmail,
        ),
        CustomRoute(
          page: ResetPasswordRoute.page,
          maintainState: false,
          initial: false,
          path: AppPaths.resetPassword,
        ),
        CustomRoute(
          page: AddBreakfastRoute.page,
          path: AppPaths.addBreakfast,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: AddBreakfastRecipeRoute.page,
          path: AppPaths.addBreakfastRecipe,
          initial: false,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [],
        ),
        CustomRoute(
          maintainState: true,
          page: EditChildProfileRoute.page,
          path: AppPaths.editChildProfile,
        ),
        CustomRoute(
          page: ViewRecipeRoute.page,
          path: AppPaths.viewRecipe,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: EditProfileRoute.page,
          path: AppPaths.editProfile,
          maintainState: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: EditChildPhotoRoute.page,
          path: AppPaths.editChildPhoto,
          maintainState: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: SubscriptionRoute.page,
          path: AppPaths.subscription,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ChildAllergyRoute.page,
          path: AppPaths.childAllergy,
          maintainState: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: MealPreferenceRoute.page,
          path: AppPaths.mealPreference,
          maintainState: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: LikeDislikeRoute.page,
          path: AppPaths.likeDislike,
          maintainState: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: DashboardRoute.page,
          maintainState: true,
          initial: false,
          path: AppPaths.dashboard,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [
            AutoRoute(
              page: EmptyMealPlanRoute.page,
              path: AppPaths.emptyMealPlan,
              maintainState: true,
              initial: true,
              children: [],
            ),
            AutoRoute(
              page: GroceryRoute.page,
              path: AppPaths.grocery,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: AppPaths.profile,
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'TabOne')
class BottomBarTabOnePage extends AutoRouter {
  const BottomBarTabOnePage({super.key});
}
