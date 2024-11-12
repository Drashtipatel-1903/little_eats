import '../../../../utils/exports.dart';
import '../../../app/core/widgets/tab_indicator.dart';

@RoutePage()
class DashboardPage extends BaseResponsiveView {
  const DashboardPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            systemBackButtonPressed(tabsRouter);
          },
          child: Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: child,
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CustomDivider(
                  color: AppColors.lightGreyColor,
                  height: Dimens.borderWidth1,
                ),
                TabIndicators(
                  activeIdx: tabsRouter.activeIndex,
                  activeColor: Theme.of(context).primaryColor,
                  numTabs: Dimens.totalTabs,
                  padding: 0,
                ),
                BottomNavigationBar(
                  unselectedItemColor: AppColors.subTextColor,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.mainTextBlackColor,
                  iconSize: Dimens.iconSize24,
                  selectedFontSize: Dimens.fontSize12,
                  selectedLabelStyle: context.textTheme.titleMedium?.copyWith(
                      inherit: true,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.fontSize14),
                  unselectedLabelStyle: context.textTheme.titleMedium?.copyWith(
                      inherit: true,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.fontSize14),
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icPlan.svg(),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icPlan.svg(
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: context.appString.planKey,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icGrocery.svg(),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icGrocery.svg(
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: context.appString.groceryKey,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icProfile.svg(),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.padding2, right: Dimens.padding2),
                        child: Assets.svgs.icProfile.svg(
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: context.appString.profileKey,
                    ),
                  ],
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildView(context);
  }

  static bool systemBackButtonPressed(TabsRouter tabsRouter) {
    final nestedRouter = tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex);
    if (nestedRouter != null && nestedRouter.canPop()) {
      nestedRouter.maybePop();
      return false;
    } else {
      if (tabsRouter.activeIndex != 0) {
        tabsRouter.setActiveIndex(0);
      } else {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      }
    }
    return false;
  }
}
