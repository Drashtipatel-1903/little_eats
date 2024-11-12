import '../../../utils/exports.dart';

class NewUserQuestionnairesState extends Equatable {
  final BaseStateStatus status;
  final List<Widget> animationJsonList;
  final int currentPagerItem;
  final int currentStep;
  final SignupLocal signupLocal;
  final TextEditingController babyNameController;
  final TextEditingController babyBirthdateController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController fullNameController;
  final bool currentPasswordObscureText;
  final bool confirmPasswordObscureText;
  final bool isBtnDisable;
  final DateTime fromDate;
  final List<AllergyOption> allergyOptions;
  final List<LikeDislikeOption> likeDislikeOption;
  final List<ExpandedLikeDislikeOption> expandedLikeDislikeOption;
  final int? expandedIndex;
  final bool isNextButtonDisable;
  final bool isExpanded;
  final bool isSelected;
  final List<CheckboxGroupValue> chipItems;

  NewUserQuestionnairesState({
    this.status = BaseStateStatus.initial,
    required this.animationJsonList,
    this.currentPagerItem = 0,
    this.currentStep = 1,
    required this.babyNameController,
    this.signupLocal = const SignupLocal(),
    required this.babyBirthdateController,
    required this.emailController,
    required this.passwordController,
    required this.fullNameController,
    this.currentPasswordObscureText = true,
    this.confirmPasswordObscureText = true,
    this.isBtnDisable = true,
    DateTime? fromDate,
    this.allergyOptions = const [],
    this.likeDislikeOption = const [],
    this.chipItems = const [],
    this.expandedLikeDislikeOption = const [],
    this.expandedIndex = -1,
    this.isNextButtonDisable = true,
    this.isSelected = false,
    this.isExpanded = false,
  }) : fromDate = fromDate ?? DateTime.now();

  NewUserQuestionnairesState copyWith({
    BaseStateStatus? status,
    List<Widget>? animationJsonList,
    int? currentPagerItem,
    SignupLocal? signupLocal,
    int? currentStep,
    TextEditingController? babyNameController,
    TextEditingController? babyBirthdateController,
    DateTime? fromDate,
    List<AllergyOption>? allergyOptions,
    List<LikeDislikeOption>? likeDislikeOption,
    List<ExpandedLikeDislikeOption>? expandedLikeDislikeOption,
    List<CheckboxGroupValue>? chipItems,
    int? expandedIndex,
    bool? isNextButtonDisable,
    bool? isSelected,
    bool? isExpanded,
    bool? isBtnDisable,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? fullNameController,
    bool? currentPasswordObscureText,
    bool? confirmPasswordObscureText,
  }) {
    return NewUserQuestionnairesState(
      status: status ?? this.status,
      animationJsonList: animationJsonList ?? this.animationJsonList,
      signupLocal: signupLocal ?? this.signupLocal,
      currentPagerItem: currentPagerItem ?? this.currentPagerItem,
      currentStep: currentStep ?? this.currentStep,
      babyNameController: babyNameController ?? this.babyNameController,
      expandedIndex: expandedIndex ?? this.expandedIndex,
      chipItems: chipItems ?? this.chipItems,
      isNextButtonDisable: isNextButtonDisable ?? this.isNextButtonDisable,
      isSelected: isSelected ?? this.isSelected,
      isExpanded: isExpanded ?? this.isExpanded,
      babyBirthdateController:
          babyBirthdateController ?? this.babyBirthdateController,
      fromDate: fromDate ?? this.fromDate,
      allergyOptions: allergyOptions ?? this.allergyOptions,
      likeDislikeOption: likeDislikeOption ?? this.likeDislikeOption,
      expandedLikeDislikeOption:
          expandedLikeDislikeOption ?? this.expandedLikeDislikeOption,
      isBtnDisable: isBtnDisable ?? this.isBtnDisable,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      fullNameController: fullNameController ?? this.fullNameController,
      currentPasswordObscureText:
          currentPasswordObscureText ?? this.currentPasswordObscureText,
      confirmPasswordObscureText:
          confirmPasswordObscureText ?? this.confirmPasswordObscureText,
    );
  }

  @override
  List<dynamic> get props => [
        status,
        animationJsonList,
        currentPagerItem,
        currentStep,
        babyNameController,
        fromDate,
        allergyOptions,
        likeDislikeOption,
        expandedLikeDislikeOption,
        expandedIndex,
        isNextButtonDisable,
        isExpanded,
        emailController,
        passwordController,
        fullNameController,
        currentPasswordObscureText,
        isBtnDisable,
        confirmPasswordObscureText,
        signupLocal,
      ];
}
