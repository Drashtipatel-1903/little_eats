import '../../../utils/exports.dart';

class CommonSearchWidget extends StatelessWidget {

  const CommonSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.padding10,
        vertical: Dimens.padding15,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteBGColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.mainTextBlackColor.withOpacity(0.1),
            blurRadius: Dimens.padding4,
            offset: const Offset(0, Dimens.padding2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.colorF4F4F4,
                border: Border.all(
                    color: AppColors.containerBorderColor,
                    width: Dimens.borderWidth1),
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimens.radius5)),
              ),
              child: CustomTextFormFieldWidget(
                controller: TextEditingController(),
                prefixIcon: Assets.svgs.icSearch,
                prefixIconSize:
                    const Size(Dimens.iconSize16, Dimens.iconSize16),
                onChange: (value) {
                  //controller.searchGasStationName(value);
                },
                hint: "Search Recipe",
                label: "Search Recipe",
                hintStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.subTextColor,
                  fontSize: Dimens.fontSize15,
                  fontWeight: FontWeight.w500,
                ),
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.subTextColor,
                  fontSize: Dimens.fontSize15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
