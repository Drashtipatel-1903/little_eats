import '../../../../../utils/exports.dart';

class ChildLikeDislikeWidget extends StatelessWidget {
  const ChildLikeDislikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserQuestionnairesCubit(
        initialState: NewUserQuestionnairesState(
            animationJsonList: [],
            babyNameController: TextEditingController(),
            babyBirthdateController: TextEditingController(),
            emailController: TextEditingController(),
            fullNameController: TextEditingController(),
            passwordController: TextEditingController()),
      )..init(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.padding30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLabelWidget(
                label: context.appString.likeDislikeHeadingKey,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: Dimens.padding2),
              CustomTextLabelWidget(
                label: context.appString.likeDislikeDescKey,
                textAlign: TextAlign.start,
                style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.subTextColor,
                  fontSize: Dimens.fontSize14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: Dimens.space40),
              BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
                builder: (context, state) {
                  if (state.likeDislikeOption.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.likeDislikeOption.length,
                    itemBuilder: (context, index) {
                      return FoodItemListWidget(
                        title: state.likeDislikeOption[index].title,
                        likes: 2,
                        dislikes: 1,
                        index: index,
                        isLikeDislikeVisible: true,
                        isExpanded: state.expandedIndex == index,
                        onTap: () {
                          context.read<NewUserQuestionnairesCubit>().toggleLikeDislike(index);
                        },
                        expandedLikeDislikeOption: [
                          ExpandedLikeDislikeOption(
                            title: "Sweet Potato",
                            isLiked: true,
                            isDislikes: true,
                            isAdd: false,
                          ),
                          ExpandedLikeDislikeOption(
                            title: "Peas",
                            isLiked: true,
                            isDislikes: true,
                            isAdd: false,
                          ),
                          ExpandedLikeDislikeOption(
                            title: "Carrot",
                            isLiked: true,
                            isDislikes: true,
                            isAdd: false,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}