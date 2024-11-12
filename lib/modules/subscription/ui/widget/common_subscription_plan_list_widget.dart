import '../../../../utils/exports.dart';

class SubscriptionPlanListWidget extends StatelessWidget {
  final String planTitle;
  final String planDesc;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool hasDiscount;
  final String? discountPercentage;

  const SubscriptionPlanListWidget({
    super.key,
    required this.planTitle,
    required this.planDesc,
    this.isSelected = false,
    this.onTap,
    this.hasDiscount = false,
    this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimens.space90,
        margin: const EdgeInsets.symmetric(
            horizontal: Dimens.padding16, vertical: Dimens.padding8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBlueBGColor : Colors.white,
          borderRadius: BorderRadius.circular(Dimens.radius16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.primary,
            width: isSelected ? Dimens.borderWidth2 : Dimens.borderWidth1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.padding16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          planTitle,
                          style: const TextStyle(
                            fontSize: Dimens.fontSize20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: Dimens.space4),
                        Text(
                          planDesc,
                          style: TextStyle(
                            fontSize: Dimens.fontSize14,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Dimens.space20,
                    height: Dimens.space20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.subTextColor,
                        width: Dimens.borderWidth1,
                      ),
                    ),
                    child: isSelected
                        ? Container(
                            margin: const EdgeInsets.all(Dimens.padding2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
            if (hasDiscount && discountPercentage != null)
              Positioned(
                right: Dimens.fontSize15,
                child: Transform.translate(
                  offset: const Offset(0, -45),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.padding12,
                        vertical: Dimens.padding6),
                    decoration: const BoxDecoration(
                      color: AppColors.proBGColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.radius8),
                      ),
                    ),
                    child: Text(
                      '${context.appString.saveKey} $discountPercentage%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.fontSize12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
