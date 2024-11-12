import '../../../../utils/exports.dart';

@RoutePage()
class NewUserQuestionnairesPage extends StatelessWidget {
  final int initialStep;

  const NewUserQuestionnairesPage({super.key, this.initialStep = 1});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => NewUserQuestionnairesCubit(
        initialState: NewUserQuestionnairesState(
          animationJsonList: const [],
          allergyOptions: const [],
          likeDislikeOption: const [],
          babyNameController: TextEditingController(),
          babyBirthdateController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          fullNameController: TextEditingController(),
        ),
      )..init(),
      child: const NewUserWidget(),
    );
  }
}
