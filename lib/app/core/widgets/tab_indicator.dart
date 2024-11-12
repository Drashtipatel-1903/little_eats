import '../../../../utils/exports.dart';

class TabIndicators extends StatelessWidget {
  final int activeIdx;
  final Color activeColor;
  final int numTabs;
  final double padding;
  final double height;
  final double indicatorWidth;
  final double borderRadius;

  const TabIndicators({
    Key? key,
    required this.activeIdx,
    required this.activeColor,
    required this.numTabs,
    this.padding = Dimens.padding16,
    this.height = Dimens.lineHeight6,
    this.indicatorWidth = Dimens.space36,
    this.borderRadius = Dimens.radius8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(numTabs, (index) {
          return Container(
            width: indicatorWidth,
            height: height,
            decoration: BoxDecoration(
              color: index == activeIdx ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          );
        }),
      ),
    );
  }
}
