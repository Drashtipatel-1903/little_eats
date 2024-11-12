import 'package:flutter/cupertino.dart';

abstract class AppString {
  static AppString of(BuildContext context) {
    return Localizations.of<AppString>(context, AppString)!;
  }

  String get appNameKey;

  String get poorInternetConnectionKey;

  String get noInternetConnectionKey;

  String get noInternetConnectionDescriptionKey;

  String get cancelKey;

  String get serverNotRespondKey;

  String get badRequestStateKey;

  String get unauthorizedKey;

  String get somethingWentWrongKey;

  String get problemWithRequestKey;

  String get dashboardPageKey;

  String get loadingKey;

  String get successMsgKey;

  String get separatorKey;

  String get customerAndLocationKey;

  String get propertyAndStructureKey;

  String get valuationAndRemarksKey;

  String get textEditingFieldKey;

  String get writeSomethingKey;

  String get saveKey;

  String get errorKey;

  String get pleaseEnterOTPKey;

  String get pleaseEnterPasswordKey;

  String get pleaseEnterValidOTPKey;

  String get passwordShouldHaveKey;

  String get pleaseAddSomethingKey;

  String get pleaseEnterEmailIdKey;

  String get pleaseEnterFullNameKey;

  String get pleaseEnterConfirmPasswordKey;

  String get confirmPasswordNotMatchingKey;

  String get pleaseEnterValidEmailIdKey;

  String get tab1Key;

  String get tab2Key;

  String get tab3Key;

  String get desktopViewKey;

  String get mobileViewKey;

  String get tabletViewKey;

  String get emailKey;

  String get nameKey;

  String get clickHereToGoBackKey;

  String get changeLanguageKey;

  String get pageNotFoundKey;

  String get emailIdKey;

  String get passwordKey;

  String get loginKey;

  String get loginDescKey;

  String get retryKey;

  String get hindiKey;

  String get englishKey;

  String get updateAppKey;

  String get updateKey;

  String get detailPageDescriptionKey;

  String get newToLittleEatsKey;

  String get forgotPassWordKey;

  String get forgotPassTitleKey;

  String get forgotPassDescKey;

  String get signupKey;

  String get fullNameKey;

  String get confirmPasswordKey;

  String get alreadyHaveAnAccountKey;

  String get iAlreadyHaveAnAccountKey;

  String get showKey;

  String get hideKey;

  String get sendKey;

  String get customMealPlanKey;

  String get parentPreferenceKey;

  String get groceryListSyncKey;

  String get groceryListKey;

  String get onBoardingDescThree;

  String get onBoardingDescTwo;

  String get onBoardingDescOne;

  String get tellAboutBabyKey;

  String get tellAboutBabyDescKey;

  String get babyNameKey;

  String get babyBirthdayKey;

  String get babysBirthdayKey;

  String get allergyHeadingKey;

  String get allergyDescKey;

  String get nextKey;

  String get selectDateKey;

  String get okKey;

  String get likeDislikeHeadingKey;

  String get likeDislikeDescKey;

  String get likeKey;

  String get dislikeKey;

  String get fullDaySolidLookKey;

  String get stepFourDescKey;

  String get breakfastKey;

  String get lunchKey;

  String get dinnerKey;

  String get snacksKey;

  String get oneKey;

  String get twoKey;

  String get threeKey;

  String get notAtAllKey;

  String get littleBitKey;

  String get sometimesKey;

  String get mostOfTimeKey;

  String get allTheTimeKey;

  String get solidMealTitleOne;

  String get solidMealTitleTwo;

  String get solidMealTitleThree;

  String get solidMealTitleFour;

  String get submitKey;

  String get planKey;

  String get groceryKey;

  String get profileKey;

  String get mealPlansKey;

  String get proKey;

  String get selectAutoMealPlanKey;

  String get addBreakFastKey;

  String get addBreakFastRecipeKey;

  String get addLunchKey;

  String get addDinnerKey;

  String get addSnacksKey;

  String get addFoodKey;

  String get addRecipeKey;

  String get copyMealKey;

  String get signupDescKey;

  String get replaceFoodKey;

  String get deleteFoodKey;

  String get viewRecipeKey;

  String get itemAddedKey;

  String get foodKey;

  String get recipeKey;

  String get eggLessKey;

  String get freezableKey;

  String get proteinKey;

  String get ironKey;

  String get highFatKey;

  String get forTheFamilyKey;

  String get lastUpdatedOn;

  String get clearGroceryListKey;

  String get deleteAccountKey;

  String get logoutKey;

  String get logoutDescKey;

  String get deleteAccountDescKey;

  String get editChildProfileKey;

  String get editProfileKey;

  String get editPhotoKey;

  String get personalDetailsKey;

  String get changePasswordKey;

  String get newPasswordKey;

  String get currentPasswordKey;

  String get confirmNewPasswordKey;

  String get myChildKey;

  String get childPreferenceKey;

  String get yourSubscriptionKey;

  String get yourSubscriptionDescKey;

  String get subscribeKey;

  String get getStartedForFreeKey;

  String get planFutureMealDescKey;

  String get threeDayFreeTrialKey;

  String get threeDayFreeTrialDescKey;

  String get restorePurchaseKey;

  String get termsOfUseKey;

  String get privacyPolicyKey;

  String get getProKey;

  String get getProDescKey;

  String get getProTermOneKey;

  String get getProTermTwoKey;

  String get getProTermThreeKey;

  String get pushNotificationKey;

  String get dummyName;

  String get dummyEmail;

  String get dummyDob;

  String get termsAndConditionKey;

  String get supportKey;

  String get allergyKey;

  String get likeDislikeKey;

  String get mealPrefKey;

  String get goodOldPancakesKey;

  String get addBreakFastFoodKey;

  String get descriptionKey;

  String get ingredientsKey;

  String get instructionsKey;

  String get recipeDescKey;

  String get cookTimeKey;

  String get prepTimeKey;

  String get monthlyKey;

  String get monthlyDescKey;

  String get annualKey;

  String get annualDescKey;

  String get instruction1;

  String get instruction2;

  String get stepKey;

  String get vegSweetPotatoKey;

  String get vegCarrotKey;

  String get vegQtyKey;

  String get totalCookingTimeKey;

  String get dummyDateKey;

  String get verifyYourEmailKey;

  String get verifyKey;

  String get verifyYourEmailDescKey;

  String get resendCodeKey;

  String get resetPasswordKey;

  String get resetPasswordDescKey;
}
