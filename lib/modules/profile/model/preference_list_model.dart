import '../../../../../../utils/exports.dart';

class PreferenceListModel {
  final String title;
  final String? icon;
  final String? notificationIcon;
  final bool? isNotificationIconVisible;

  const PreferenceListModel({
    required this.title,
    this.icon,
    this.isNotificationIconVisible = false,
    this.notificationIcon,
  });
}

final List<PreferenceListModel> preferenceItem = [
  PreferenceListModel(
    title: MainConfig.context.appString.allergyKey,
    icon: Assets.svgs.icBackForward.path,
  ),
  PreferenceListModel(
    title: MainConfig.context.appString.likeDislikeKey,
    icon: Assets.svgs.icBackForward.path,
  ),
  PreferenceListModel(
    title: MainConfig.context.appString.mealPrefKey,
    icon: Assets.svgs.icBackForward.path,
  ),
];
