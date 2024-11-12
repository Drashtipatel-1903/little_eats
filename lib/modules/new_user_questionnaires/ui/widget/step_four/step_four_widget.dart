import '../../../../../utils/exports.dart';

class StepFourWidget extends StatelessWidget {
  const StepFourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: Dimens.padding30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextLabelWidget(
              label: context.appString.fullDaySolidLookKey,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.mainTextBlackColor,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Dimens.padding2),
            CustomTextLabelWidget(
              label: context.appString.stepFourDescKey,
              textAlign: TextAlign.start,
              style: context.textTheme.titleSmall?.copyWith(
                color: AppColors.subTextColor,
                fontSize: Dimens.fontSize14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Dimens.space40),
            CustomChipWidget(
              title: context.appString.solidMealTitleOne,
              chipItems: [
                CheckboxGroupValue(
                  label: context.appString.breakfastKey,
                  isSelected: true,
                  isShowCheckMark: true,
                  value: context.appString.breakfastKey,
                ),
                CheckboxGroupValue(
                  label: context.appString.lunchKey,
                  isSelected: false,
                  isShowCheckMark: false,
                  value: context.appString.lunchKey,
                ),
                CheckboxGroupValue(
                  label: context.appString.dinnerKey,
                  isSelected: false,
                  isShowCheckMark: false, // No icon on dinner
                  value: context.appString.dinnerKey,
                ),
                CheckboxGroupValue(
                  label: context.appString.snacksKey,
                  isSelected: false,
                  isShowCheckMark: false, // No icon on snacks
                  value: context.appString.snacksKey,
                ),
              ],
              onChipsTap: (int index, bool selected) {
                context.read<NewUserQuestionnairesCubit>().toggleChipSelection(index);
              },
              showCheckmark: true,
            ),
            const SizedBox(height: Dimens.space24),
            CustomChipWidget(
              title: context.appString.solidMealTitleTwo,
              chipItems: [
                CheckboxGroupValue(
                    label: context.appString.oneKey,
                    isSelected: true,
                    isShowCheckMark: false,
                    value: context.appString.oneKey),
                CheckboxGroupValue(
                    label: context.appString.twoKey,
                    isSelected: false,
                    value: context.appString.twoKey),
                CheckboxGroupValue(
                    label: context.appString.threeKey,
                    isSelected: false,
                    value: context.appString.threeKey),
              ],
              onChipsTap: (int index, bool selected) {
                context
                    .read<NewUserQuestionnairesCubit>()
                    .toggleChipSelection(index);
              },
            ),
            const SizedBox(height: Dimens.space24),
            CustomChipWidget(
              title: context.appString.solidMealTitleThree,
              chipItems: [
                CheckboxGroupValue(
                    label: context.appString.oneKey,
                    isSelected: true,
                    value: context.appString.oneKey),
                CheckboxGroupValue(
                    label: context.appString.twoKey,
                    isSelected: false,
                    value: context.appString.twoKey),
                CheckboxGroupValue(
                    label: context.appString.threeKey,
                    isSelected: false,
                    value: context.appString.threeKey),
              ],
              onChipsTap: (int index, bool selected) {
                context
                    .read<NewUserQuestionnairesCubit>()
                    .toggleChipSelection(index);
              },
            ),
            const SizedBox(height: Dimens.space24),
            CustomChipWidget(
              title: context.appString.solidMealTitleFour,
              chipItems: [
                CheckboxGroupValue(
                    label: context.appString.notAtAllKey,
                    isSelected: true,
                    value: context.appString.notAtAllKey),
                CheckboxGroupValue(
                    label: context.appString.littleBitKey,
                    isSelected: false,
                    value: context.appString.littleBitKey),
                CheckboxGroupValue(
                    label: context.appString.sometimesKey,
                    isSelected: false,
                    value: context.appString.sometimesKey),
                CheckboxGroupValue(
                    label: context.appString.mostOfTimeKey,
                    isSelected: false,
                    value: context.appString.mostOfTimeKey),
                CheckboxGroupValue(
                    label: context.appString.allTheTimeKey,
                    isSelected: false,
                    value: context.appString.allTheTimeKey),
              ],
              onChipsTap: (int index, bool selected) {
                context
                    .read<NewUserQuestionnairesCubit>()
                    .toggleChipSelection(index);
              },
            ),
          ],
        ));
  }
}
