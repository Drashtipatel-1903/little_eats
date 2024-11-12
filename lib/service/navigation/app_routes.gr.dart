// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:little_eats/modules/add_breakfast/ui/add_breakfast_page.dart'
    as _i1;
import 'package:little_eats/modules/add_breakfast_recipe/ui/add_breakfast_recipe_page.dart'
    as _i2;
import 'package:little_eats/modules/child_allergy/ui/child_allergy_page.dart'
    as _i4;
import 'package:little_eats/modules/dashboard/ui/dashboard_page.dart' as _i5;
import 'package:little_eats/modules/empty_meal_plan/ui/empty_meal_plan_page.dart'
    as _i9;
import 'package:little_eats/modules/force_update_under_maintenance/ui/force_update_under_maintenance_page.dart'
    as _i10;
import 'package:little_eats/modules/forgot_password/ui/forgot_password_page.dart'
    as _i11;
import 'package:little_eats/modules/grocery/ui/grocery_page.dart' as _i12;
import 'package:little_eats/modules/like_dislike/ui/like_dislike_page.dart'
    as _i13;
import 'package:little_eats/modules/login/ui/login_page.dart' as _i14;
import 'package:little_eats/modules/meal_preference/ui/meal_preference_page.dart'
    as _i15;
import 'package:little_eats/modules/new_user_questionnaires/ui/new_user_questionnaires_page.dart'
    as _i16;
import 'package:little_eats/modules/on_boarding/ui/on_boarding_page.dart'
    as _i17;
import 'package:little_eats/modules/page_not_found/ui/page_not_found_page.dart'
    as _i18;
import 'package:little_eats/modules/profile/edit_child_profile/edit_photo/ui/edit_child_photo_page.dart'
    as _i6;
import 'package:little_eats/modules/profile/edit_child_profile/ui/edit_child_profile_page.dart'
    as _i7;
import 'package:little_eats/modules/profile/edit_profile/ui/edit_profile_page.dart'
    as _i8;
import 'package:little_eats/modules/profile/ui/profile_page.dart' as _i19;
import 'package:little_eats/modules/reset_password/ui/reset_password_page.dart'
    as _i20;
import 'package:little_eats/modules/splash/ui/splash_page.dart' as _i21;
import 'package:little_eats/modules/subscription/ui/subscription_page.dart'
    as _i22;
import 'package:little_eats/modules/verify_email/ui/verify_email_page.dart'
    as _i23;
import 'package:little_eats/modules/view_recipe/ui/view_recipe_page.dart'
    as _i24;
import 'package:little_eats/service/navigation/app_routes.dart' as _i3;
import 'package:little_eats/utils/exports.dart' as _i26;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AddBreakfastRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddBreakfastPage(),
      );
    },
    AddBreakfastRecipeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddBreakfastRecipePage(),
      );
    },
    TabOne.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BottomBarTabOnePage(),
      );
    },
    ChildAllergyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChildAllergyPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardPage(),
      );
    },
    EditChildPhotoRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditChildPhotoPage(),
      );
    },
    EditChildProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EditChildProfilePage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EditProfilePage(),
      );
    },
    EmptyMealPlanRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyMealPlanPage(),
      );
    },
    ForceUpdateUnderMaintenanceRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForceUpdateUnderMaintenancePage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ForgotPasswordPage(),
      );
    },
    GroceryRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.GroceryPage(),
      );
    },
    LikeDislikeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LikeDislikePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.LoginPage(),
      );
    },
    MealPreferenceRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MealPreferencePage(),
      );
    },
    NewUserQuestionnairesRoute.name: (routeData) {
      final args = routeData.argsAs<NewUserQuestionnairesRouteArgs>(
          orElse: () => const NewUserQuestionnairesRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.NewUserQuestionnairesPage(
          key: args.key,
          initialStep: args.initialStep,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.OnBoardingPage(),
      );
    },
    RouteNotFound.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PageNotFound(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ProfilePage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ResetPasswordPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SplashPage(),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SubscriptionPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.VerifyEmailPage(),
      );
    },
    ViewRecipeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ViewRecipePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBreakfastPage]
class AddBreakfastRoute extends _i25.PageRouteInfo<void> {
  const AddBreakfastRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AddBreakfastRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBreakfastRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBreakfastRecipePage]
class AddBreakfastRecipeRoute extends _i25.PageRouteInfo<void> {
  const AddBreakfastRecipeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AddBreakfastRecipeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBreakfastRecipeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BottomBarTabOnePage]
class TabOne extends _i25.PageRouteInfo<void> {
  const TabOne({List<_i25.PageRouteInfo>? children})
      : super(
          TabOne.name,
          initialChildren: children,
        );

  static const String name = 'TabOne';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChildAllergyPage]
class ChildAllergyRoute extends _i25.PageRouteInfo<void> {
  const ChildAllergyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ChildAllergyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChildAllergyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i25.PageRouteInfo<void> {
  const DashboardRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditChildPhotoPage]
class EditChildPhotoRoute extends _i25.PageRouteInfo<void> {
  const EditChildPhotoRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EditChildPhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditChildPhotoRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EditChildProfilePage]
class EditChildProfileRoute extends _i25.PageRouteInfo<void> {
  const EditChildProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EditChildProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditChildProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EditProfilePage]
class EditProfileRoute extends _i25.PageRouteInfo<void> {
  const EditProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EmptyMealPlanPage]
class EmptyMealPlanRoute extends _i25.PageRouteInfo<void> {
  const EmptyMealPlanRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EmptyMealPlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyMealPlanRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForceUpdateUnderMaintenancePage]
class ForceUpdateUnderMaintenanceRoute extends _i25.PageRouteInfo<void> {
  const ForceUpdateUnderMaintenanceRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ForceUpdateUnderMaintenanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForceUpdateUnderMaintenanceRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ForgotPasswordPage]
class ForgotPasswordRoute extends _i25.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.GroceryPage]
class GroceryRoute extends _i25.PageRouteInfo<void> {
  const GroceryRoute({List<_i25.PageRouteInfo>? children})
      : super(
          GroceryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroceryRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LikeDislikePage]
class LikeDislikeRoute extends _i25.PageRouteInfo<void> {
  const LikeDislikeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LikeDislikeRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikeDislikeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LoginPage]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.MealPreferencePage]
class MealPreferenceRoute extends _i25.PageRouteInfo<void> {
  const MealPreferenceRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MealPreferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MealPreferenceRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NewUserQuestionnairesPage]
class NewUserQuestionnairesRoute
    extends _i25.PageRouteInfo<NewUserQuestionnairesRouteArgs> {
  NewUserQuestionnairesRoute({
    _i26.Key? key,
    int initialStep = 1,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          NewUserQuestionnairesRoute.name,
          args: NewUserQuestionnairesRouteArgs(
            key: key,
            initialStep: initialStep,
          ),
          initialChildren: children,
        );

  static const String name = 'NewUserQuestionnairesRoute';

  static const _i25.PageInfo<NewUserQuestionnairesRouteArgs> page =
      _i25.PageInfo<NewUserQuestionnairesRouteArgs>(name);
}

class NewUserQuestionnairesRouteArgs {
  const NewUserQuestionnairesRouteArgs({
    this.key,
    this.initialStep = 1,
  });

  final _i26.Key? key;

  final int initialStep;

  @override
  String toString() {
    return 'NewUserQuestionnairesRouteArgs{key: $key, initialStep: $initialStep}';
  }
}

/// generated route for
/// [_i17.OnBoardingPage]
class OnBoardingRoute extends _i25.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PageNotFound]
class RouteNotFound extends _i25.PageRouteInfo<void> {
  const RouteNotFound({List<_i25.PageRouteInfo>? children})
      : super(
          RouteNotFound.name,
          initialChildren: children,
        );

  static const String name = 'RouteNotFound';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ProfilePage]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ResetPasswordPage]
class ResetPasswordRoute extends _i25.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SplashPage]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SubscriptionPage]
class SubscriptionRoute extends _i25.PageRouteInfo<void> {
  const SubscriptionRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.VerifyEmailPage]
class VerifyEmailRoute extends _i25.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i25.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ViewRecipePage]
class ViewRecipeRoute extends _i25.PageRouteInfo<void> {
  const ViewRecipeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ViewRecipeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewRecipeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
