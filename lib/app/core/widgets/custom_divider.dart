import '../../../utils/exports.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final  Color? color;
  final double? width;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;

 const CustomDivider(
      {super.key,
      this.height,
      this.color,
      this.width,
      this.child,
      this.decoration,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      color: color,
      width: width,
      decoration: decoration,
      child: child,
    );
  }
}
