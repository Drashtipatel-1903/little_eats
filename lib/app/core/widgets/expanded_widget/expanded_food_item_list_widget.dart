import '../../../../../utils/exports.dart';

class ExpandedFoodItemListWidget extends StatelessWidget {
  final String title;
  final bool isLiked;
  final bool isDislikes;
  final bool isAdded;
  final bool isAddButtonVisible;
  final bool isImageVisible;
  final VoidCallback? onLikeClick;
  final VoidCallback? onDislikeClick;
  final VoidCallback? onCheckboxClick;
  final VoidCallback? onAddClick;
  final bool isLastItem;
  final String? foodImage;
  final bool isCheckboxVisible;
  final String quantity;
  final bool isQuantityVisible;

  const ExpandedFoodItemListWidget({
    Key? key,
    required this.title,
    this.isLiked = false,
    this.isDislikes = false,
    this.foodImage,
    this.isAdded = false,
    this.isAddButtonVisible = false,
    this.isImageVisible = false,
    this.isCheckboxVisible = false,
    this.isQuantityVisible = false,
    this.quantity = '',
    this.onLikeClick,
    this.onDislikeClick,
    this.onCheckboxClick,
    this.onAddClick,
    this.isLastItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
                top: Dimens.padding10,
                right: Dimens.padding8,
                left: Dimens.padding0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (foodImage != null && isImageVisible)
                  Container(
                      width: Dimens.iconSize48,
                      height: Dimens.iconSize48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        foodImage!,
                        fit: BoxFit.cover,
                      )),
                const SizedBox(width: Dimens.space16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontSize: Dimens.fontSize15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainTextBlackColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if(isQuantityVisible)
                        Text(
                          quantity,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: Dimens.fontSize10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.subTextColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  )
                ),
                /// TODO : IN future Use if needed
                /*if (isLiked)
                  GestureDetector(
                    onTap: onLikeClick,
                    child: Assets.svgs.icLike.svg(
                      height: Dimens.iconSize18,
                      width: Dimens.iconSize18,
                      colorFilter: ColorFilter.mode(
                          isDislikes ? Colors.grey : Colors.green,
                          BlendMode.srcIn),
                    ),
                  ),
                const SizedBox(width: Dimens.space16),*/
                if (isDislikes)
                  GestureDetector(
                    onTap: onDislikeClick,
                    child: Assets.svgs.icDislike.svg(
                      height: Dimens.iconSize18,
                      width: Dimens.iconSize18,
                      colorFilter: ColorFilter.mode(
                          isDislikes ? Colors.grey : Colors.green,
                          BlendMode.srcIn),
                    ),
                  ),
                SizedBox(
                    width: isAddButtonVisible
                        ? Dimens.padding16
                        : Dimens.padding0),
                if (isAddButtonVisible)
                  GestureDetector(
                    onTap: onAddClick,
                    child: Assets.svgs.icAdd
                        .svg(height: Dimens.iconSize30, width: Dimens.iconSize30
                            //color: isAdded ? Colors.green : Colors.grey,
                            ),
                  ),
                if (isCheckboxVisible)
                  GestureDetector(
                    onTap: onCheckboxClick,
                    child: Assets.svgs.icCheckbox.svg(
                      height: Dimens.iconSize24,
                      width: Dimens.iconSize24,
                      colorFilter: ColorFilter.mode(
                          isDislikes ? Colors.green : Colors.grey,
                          BlendMode.srcIn),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Dimens.space10),
        if (!isLastItem)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CustomDivider(
              height: Dimens.borderWidth1,
              color: AppColors.inActiveGrayColor.withOpacity(0.7),
            ),
          ),
        const SizedBox(height: Dimens.space6),

      ],
    );
  }
}
