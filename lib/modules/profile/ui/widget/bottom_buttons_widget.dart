import '../../../../../utils/exports.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showCustomDialogOld(
              context.appString.deleteAccountDescKey,
              title: context.appString.deleteAccountKey,
              okBtnTitle: "Yes, Delete",
              cancelBtnTitle: context.appString.cancelKey,
              onOkClicked: () {
                Navigator.pop(context);
              },
              onCancelClicked: () {
                Navigator.pop(context);
              },
            );
          },

          child: CustomTextLabelWidget(
            label: context.appString.deleteAccountKey,
            style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.redTextColor,
                fontSize: Dimens.fontSize15,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationThickness: Dimens.borderWidth1_5,
                decorationColor: AppColors.redTextColor),
          ),
        ),
        const SizedBox(
          height: Dimens.space32,
        ),
        InkWell(
          onTap: () {
            showCustomDialog(
              message : context.appString.logoutDescKey,
              title: context.appString.logoutKey,
              okBtnTitle: context.appString.logoutKey,
              cancelBtnTitle: context.appString.cancelKey,
              onOkClicked: () {
                Navigator.pop(context);
              },
              onCancelClicked: () {
                Navigator.pop(context);
              },
            );
          },
          child: CustomTextLabelWidget(
            label: context.appString.logoutKey,
            style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.redTextColor,
                fontSize: Dimens.fontSize15,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationThickness: Dimens.borderWidth1_5,
                decorationColor: AppColors.redTextColor),
          ),
        ),
        const SizedBox(
          height: Dimens.space32,
        ),
      ],
    );
  }
}
