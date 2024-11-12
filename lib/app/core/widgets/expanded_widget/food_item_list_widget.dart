import '../../../../utils/exports.dart';

class FoodItemListWidget extends StatelessWidget {
  final String title;
  final int likes;
  final int dislikes;
  final int itemAdded;
  final int itemCount;
  final bool isItemAdded;
  final bool isLikeDislikeVisible;
  final bool isItemCountVisible;
  final VoidCallback? onTap;
  final bool isExpanded;
  final int index;
  final List<ExpandedLikeDislikeOption> expandedLikeDislikeOption;

  const FoodItemListWidget({
    Key? key,
    required this.title,
    this.likes = 1,
    this.dislikes = 1,
    this.itemAdded = 1,
    this.itemCount = 2,
    this.isItemAdded = false,
    this.isLikeDislikeVisible = false,
    this.isItemCountVisible = false,
    this.onTap,
    this.isExpanded = false,
    required this.index,
    required this.expandedLikeDislikeOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: Dimens.padding10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.padding8),
            border: Border.all(
              width: Dimens.borderWidth1,
              color: Colors.grey.shade300,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(Dimens.radius8),
              child: Padding(
                padding: const EdgeInsets.all(Dimens.padding14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          title,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: Dimens.fontSize14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainTextBlackColor,
                          ),
                          maxLines: Dimens.maxLines02,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: Dimens.space4,
                        ),
                        if (isItemCountVisible)
                          Text(
                            "($itemCount)",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: Dimens.fontSize14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          )
                      ],
                    )),
                    Row(
                      children: [
                        if (isItemAdded)
                          CustomTextLabelWidget(
                            label:
                                '$itemAdded ${context.appString.itemAddedKey}',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: Dimens.fontSize14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        if (isLikeDislikeVisible)
                          RichText(
                            text: TextSpan(
                              children: [
                                /// TODO : IN future Use if needed
                              /*  TextSpan(
                                  text: '$likes ${context.appString.likeKey}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: '  |  ',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),*/
                                TextSpan(
                                  text:
                                      '$dislikes ${context.appString.dislikeKey}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(width: Dimens.space20),
                        isExpanded
                            ? Assets.svgs.icArrowUp.svg()
                            : Assets.svgs.icDropdown.svg(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isExpanded)
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                top: Dimens.padding0,
                left: Dimens.padding6,
                right: Dimens.padding6),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expandedLikeDislikeOption.length,
            itemBuilder: (BuildContext context, int index) {
              final option = expandedLikeDislikeOption[index];
              return ExpandedFoodItemListWidget(
                title: option.title ?? '',
                quantity: option.qty ?? '',
                isLiked: option.isLiked,
                isDislikes: option.isDislikes,
                isAddButtonVisible: option.isAdd,
                isImageVisible: option.isAdd,
                isLastItem: index == expandedLikeDislikeOption.length - 1,
                foodImage: Assets.png.icVegetable.path,
                onLikeClick: () {},
                onDislikeClick: () {},
                onAddClick: () {},
                isCheckboxVisible: option.isCheckboxVisible,
                isQuantityVisible: option.isQuantityVisible,
              );
            },
          ),
      ],
    );
  }
}
