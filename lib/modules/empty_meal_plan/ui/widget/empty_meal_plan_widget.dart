
import '../../../../utils/exports.dart';

class EmptyMealPlanWidget extends StatelessWidget {
  const EmptyMealPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealPlanHeader(),
          //CalenderCommonWidget(),
            CalenderWidget(),
          //CalenderWeekWidget(),
          AutoSelectMealWidget(),
          AddMealListWidget(),
        ],
      ),
    );
  }
}
