import '../../../../utils/exports.dart';

class CustomDottedBorderWidget<T> extends StatelessWidget {
  final double width;
 final Widget child;

 const CustomDottedBorderWidget(
      {super.key, this.width = Dimens.thick1, required this.child});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.lightGrayBGColor,
      strokeWidth: width,
      child: child,
    );
  }
}
