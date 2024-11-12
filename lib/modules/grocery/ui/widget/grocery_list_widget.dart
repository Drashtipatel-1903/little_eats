import '../../../../../../utils/exports.dart';

class GroceryListWidget extends StatelessWidget {
  const GroceryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Dimens.space24,
        ),
        const GroceryHeaderWidget(),
        const GroceryRefreshWidget(),
        Expanded(
          child: BlocBuilder<GroceryListCubit, GroceryListState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(Dimens.padding16),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.likeDislikeOption.length,
                  itemBuilder: (context, index) {
                    return FoodItemListWidget(
                      title: state.likeDislikeOption[index].title,
                      likes: state.likeDislikeOption[index].likes,
                      dislikes: state.likeDislikeOption[index].dislikes,
                      index: index,
                      isLikeDislikeVisible: false,
                      isItemCountVisible: true,
                      itemCount: 2,
                      isExpanded: state.expandedIndex == index,
                      onTap: () {
                        context
                            .read<GroceryListCubit>()
                            .toggleLikeDislike(index);
                      },
                      expandedLikeDislikeOption: [
                        ExpandedLikeDislikeOption(
                          title: context.appString.vegSweetPotatoKey,
                          isCheckboxVisible: true,
                          isQuantityVisible: true,
                          qty: context.appString.vegQtyKey,
                        ),
                        ExpandedLikeDislikeOption(
                          title: context.appString.vegCarrotKey,
                          isCheckboxVisible: true,
                          isQuantityVisible: true,
                          qty: context.appString.vegQtyKey,
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.padding16),
          child: CustomButtonWidget(
            onClick: () {},
            text: context.appString.clearGroceryListKey,
            textStyle: context.textTheme.titleMedium?.copyWith(
              color: AppColors.whiteTextColor,
              fontSize: Dimens.fontSize16,
            ),
          ),
        ),
      ],
    );
  }
}
