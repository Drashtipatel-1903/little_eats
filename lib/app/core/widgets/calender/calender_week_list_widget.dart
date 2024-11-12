import '../../../../utils/exports.dart';
import 'calender_model.dart';
import 'calender_week_item_view.dart';

class CalenderWeekWidget extends StatelessWidget {
  const CalenderWeekWidget(
      {super.key, required this.onDateSelected, required this.calenderModel});

  final Function(String) onDateSelected;
  final List<CalenderModel> calenderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: Dimens.space50,
      child: Visibility(
        visible: calenderModel.isNotEmpty,
        replacement: const SizedBox.shrink(),
        child: ListView.builder(
          itemCount: calenderModel.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CalenderWeekItemView(
              index: index,
              calenderModel: calenderModel,
              onDateSelected: (String date) {
                onDateSelected.call(date);
              /*  context.instance<CalenderBloc>().add(
                      DateSelectedEvent(
                        DateTime.parse(date),
                      ),
                    );*/
              },
            );
          },
        ),
      ),
    );
  }
}
