import '../../../../utils/exports.dart';

class AddBreakfastListWidget extends StatelessWidget {
  const AddBreakfastListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSearchVisibleNotifier = ValueNotifier(false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Dimens.space32,
            ),
            AppbarWithTitleIcon(
              title: context.appString.addBreakFastFoodKey,
              onCloseButtonTap: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
                Navigator.pop(context);
              },
              isSearchVisibleNotifier: isSearchVisibleNotifier,
            ),
            const CustomDivider(
              height: Dimens.borderWidth1_5,
              color: AppColors.lightGreyColor,
            ),
            Expanded(
              child: BlocBuilder<AddBreakfastCubit, AddBreakfastState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: state.likeDislikeOption.length,
                      itemBuilder: (context, index) {
                        final option = state.likeDislikeOption[index];
                        return FoodItemListWidget(
                          title: option.title,
                          likes: option.likes,
                          dislikes: option.dislikes,
                          index: index,
                          isLikeDislikeVisible: false,
                          isExpanded: state.expandedIndex == index,
                          isItemAdded: true,
                          onTap: () {
                            context
                                .read<AddBreakfastCubit>()
                                .toggleLikeDislike(index);
                          },
                          expandedLikeDislikeOption: [
                            ExpandedLikeDislikeOption(
                                title: context.appString.vegSweetPotatoKey,
                                isAdd: true,
                                isDislikes: false,
                                isLiked: false,
                                isImageVisible: true),
                            ExpandedLikeDislikeOption(
                                title: context.appString.vegCarrotKey,
                                isAdd: true,
                                isDislikes: false,
                                isLiked: false,
                                isImageVisible: true),
                            ExpandedLikeDislikeOption(
                                title: context.appString.vegSweetPotatoKey,
                                isAdd: true,
                                isDislikes: false,
                                isLiked: false,
                                isImageVisible: true),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButtonWidget(
                onClick: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  Navigator.pop(context);
                },
                text: context.appString.addFoodKey,
                textStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.whiteTextColor,
                    fontSize: Dimens.fontSize16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
