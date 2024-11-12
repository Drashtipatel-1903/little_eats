import 'exports.dart';

abstract class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  Radius get circularRadius => Radius.circular(toDouble());

  EdgeInsetsGeometry get padding => EdgeInsets.all(toDouble());

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? strokeAlign,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? AppColors.whiteBGColor,
        width: toDouble(),
        style: style ?? BorderStyle.solid,
        strokeAlign: strokeAlign ?? -1.0,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension RxnBoolExt on bool? {
  bool? get isTrue => this;

  bool? get isFalse {
    if (this != null) return !isTrue!;
    return null;
  }
}
