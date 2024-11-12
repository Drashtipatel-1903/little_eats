import '../../../../../utils/exports.dart';

/// Custom widget to show Customised AppBar as per the requirement.
///
/// This Widget includes BackButton, TitleWidget and TrailingIcons.
class MainAppBarTitleWidget extends StatelessWidget {
 final String? title;

  const MainAppBarTitleWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: title.isNotNullOrEmpty,
      child: CustomTextLabelWidget(
        label: title ?? "",
      ),
    );
  }
}
