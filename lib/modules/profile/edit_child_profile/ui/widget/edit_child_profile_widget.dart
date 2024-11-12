import '../../../../../utils/exports.dart';

class EditChildProfileWidget extends StatelessWidget {
  const EditChildProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteBGColor,
      child: Column(
        children: [
          const SizedBox(
            height: Dimens.space32,
          ),
          Material(
            elevation: Dimens.elevation1,
            child: CenterAppbarWidget(
              title: context.appString.editChildProfileKey,
              isBackButtonVisible: true,
              isCloseButtonVisible: false,
              onBackButtonTap: () {
                Navigator.pop(context);
              },
              onCloseButtonTap: () {},
            ),
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteBGColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.containerBorderColor),
            ),
            child: Assets.svgs.icProfilePic.svg(
              height: Dimens.iconSize120,
              width: Dimens.iconSize120,
            ),
          ),
          const SizedBox(
            height: Dimens.space6,
          ),
          InkWell(
            onTap: () {
              context.router.pushNamed(AppPaths.editChildPhoto);
            },
            child: CustomTextLabelWidget(
              label: context.appString.editPhotoKey,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: Dimens.fontSize13,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: Dimens.space24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.padding16,
              right: Dimens.padding16,
            ),
            child: CustomTextFormFieldWidget(
              controller: TextEditingController(),
              hint: context.appString.babyNameKey,
              label: context.appString.babyNameKey,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.hintTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w500,
              ),
              textInputType: TextInputType.text,
              input: TextInputAction.next,
              onChange: (value) {
                //newUserQuestionnairesCubit.checkIfFormIsFilled();
              },
            ),
          ),
          const SizedBox(
            height: Dimens.space24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.padding16,
              right: Dimens.padding16,
            ),
            child: InkWell(
              onTap: () {},
              child: CustomTextFormFieldWidget(
                controller: TextEditingController(),
                hint: context.appString.babyBirthdayKey,
                label: context.appString.babyBirthdayKey,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                textInputType: TextInputType.text,
                input: TextInputAction.next,
                suffixIcon: Assets.svgs.icCalender,
                onTap: () {},
                isEditable: false,
                readOnly: false,
                suffixOnClick: () async {},
              ),
            ),
          ),
          const SizedBox(
            height: Dimens.space28,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.padding16,
              right: Dimens.padding16,
            ),
            child: CustomButtonWidget(
              text: context.appString.saveKey,
              textStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
