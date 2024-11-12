import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../utils/exports.dart';

class EditChildPhotoWidget extends StatelessWidget {
  const EditChildPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> selectedAvatarNotifier = ValueNotifier<int?>(null);

    final List<String> avatars = [
      Assets.svgs.icAvtar1.path,
      Assets.svgs.icAvtar2.path,
      Assets.svgs.icAvtar3.path,
      Assets.svgs.icAvtar4.path,
      Assets.svgs.icAvtar5.path,
      Assets.svgs.icAvtar6.path,
      Assets.svgs.icAvtar7.path,
      Assets.svgs.icAvtar8.path,
    ];

    return Column(
      children: [
        const SizedBox(height: Dimens.space32),
        Material(
          elevation: Dimens.elevation1,
          child: CenterAppbarWidget(
            title: context.appString.editPhotoKey,
            isBackButtonVisible: true,
            isCloseButtonVisible: false,
            onBackButtonTap: () {
              Navigator.pop(context);
            },
            onCloseButtonTap: () {},
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(Dimens.padding16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: Dimens.padding16,
              mainAxisSpacing: Dimens.padding16,
            ),
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return ValueListenableBuilder<int?>(
                valueListenable: selectedAvatarNotifier,
                builder: (context, selectedIndex, _) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      selectedAvatarNotifier.value = index;
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? AppColors.primary : Colors.transparent,
                              width: Dimens.borderWidth2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimens.padding2),
                            child: SvgPicture.asset(

                              avatars[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(4.0),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}