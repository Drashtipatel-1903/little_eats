import '../../../../../../utils/exports.dart';

@RoutePage()
class AddBreakfastPage extends StatelessWidget {
  const AddBreakfastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AddBreakfastCubit(
        initialState: AddBreakfastState(

          likeDislikeOption: const [],
        ),
      )..init(),
      child: const AddBreakfastListWidget(),
    );
  }
}
