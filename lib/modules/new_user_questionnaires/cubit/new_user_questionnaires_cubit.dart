import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/exports.dart';

class NewUserQuestionnairesCubit extends Cubit<NewUserQuestionnairesState> {
  final formKey = GlobalKey<FormState>();

  NewUserQuestionnairesCubit({
    required NewUserQuestionnairesState initialState,
  }) : super(initialState);

  init() {
    List<AllergyOption> allergyOptions = [
      AllergyOption(title: 'No', isSelected: false),
      AllergyOption(title: 'Soy', isSelected: false),
      AllergyOption(title: 'Nut', isSelected: false),
      AllergyOption(title: 'Peanut', isSelected: false),
      AllergyOption(title: 'Shellfish', isSelected: false),
      AllergyOption(title: 'Egg', isSelected: false),
      AllergyOption(title: 'Wheat', isSelected: false),
      AllergyOption(title: 'Dairy', isSelected: false),
      AllergyOption(title: 'Sesame', isSelected: false),
      AllergyOption(title: 'Fish', isSelected: false),
    ];

    List<LikeDislikeOption> likeDislikeOption = [
      LikeDislikeOption(title: 'Dairy', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Breads', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Snack', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Meat', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Fruit', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Protein', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Grains', likes: 2, dislikes: 1),
    ];

    List<ExpandedLikeDislikeOption> expandedList = [
      ExpandedLikeDislikeOption(
          title: 'Sweet Potatoes', isDislikes: false, isLiked: false),
      ExpandedLikeDislikeOption(
          title: 'Carrots', isDislikes: false, isLiked: false),
      ExpandedLikeDislikeOption(
          title: 'peas', isDislikes: false, isLiked: false),
    ];

    emit(state.copyWith(
        allergyOptions: allergyOptions,
        likeDislikeOption: likeDislikeOption,
        expandedLikeDislikeOption: expandedList));
  }

  void navigateToNextStep() {
    if (state.currentStep < 5) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void navigateToPreviousStep() {
    if (state.currentStep > 1) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  DateTime calculateDate() {
    DateTime today = DateTime.now();
    return DateTime(today.year - 10, today.month, today.day);
  }

  void updateFromDate(DateTime date) {
    emit(state.copyWith(fromDate: date));
  }

  void updateAllergySelection(int index) {
    final updatedOptions = List<AllergyOption>.from(state.allergyOptions);
    updatedOptions[index] = updatedOptions[index].copyWith(
      isSelected: !updatedOptions[index].isSelected,
    );
    emit(state.copyWith(allergyOptions: updatedOptions));
  }

  void checkIfFormIsFilled() {
    final isFilled = state.babyNameController.text.isNotEmpty &&
        state.babyBirthdateController.text.isNotEmpty;
    emit(state.copyWith(isNextButtonDisable: !isFilled));
  }

/*  void onLikeClick(int index) {
    final updatedOptions =
        List<LikeDislikeOption>.from(state.likeDislikeOption);
    updatedOptions[index] = updatedOptions[index].copyWith(isLiked: true);
    emit(state.copyWith(likeDislikeOption: updatedOptions));
  }

  void onDislikeClick(int index) {
    final updatedOptions =
        List<LikeDislikeOption>.from(state.likeDislikeOption);
    updatedOptions[index] = updatedOptions[index].copyWith(isDislikes: false);
    emit(state.copyWith(likeDislikeOption: updatedOptions));
  }

  void toggleExpand(int index) {
    final newIndex = (state.expandedIndex == index) ? -1 : index;
    emit(state.copyWith(expandedIndex: newIndex));
  }*/

  void toggleLikeDislike(int index) {
    if (state.expandedIndex == index) {
      emit(state.copyWith(expandedIndex: index));
    } else {
      emit(state.copyWith(expandedIndex: index));
    }
  }

  void toggleChipSelection(int index) {
    if (index >= 0 && index < state.chipItems.length) {
      final updatedChips = List<CheckboxGroupValue>.from(state.chipItems)
        ..[index] = state.chipItems[index].copyWith(
            isSelected: !(state.chipItems[index].isSelected ?? false));

      emit(state.copyWith(chipItems: updatedChips));
    } else {
      debugPrint('Error: Index $index is out of bounds for chipItems list.');
    }
  }

  bool isEmailValid(String email) {
    return email.trim().validateEmail(MainConfig.context) == null;
  }

  /// Check if the password is valid
  bool isPasswordValid(String password) {
    return password.trim().validatePassword(MainConfig.context) == null;
  }

  /// Check if the fullName is valid
  bool isFullNameValid(String fullName) {
    return fullName.trim().validateFullName(MainConfig.context) == null;
  }

  /// Check if the fullName is valid
  bool isConfirmPasswordValid(String confirmPassword) {
    return confirmPassword
            .trim()
            .validateConfirmPassword(MainConfig.context, confirmPassword) ==
        null;
  }

  void checkFormValidity() {
    final email = state.emailController.text;
    final password = state.passwordController.text;
    final fullName = state.fullNameController.text;

    final isValid = isEmailValid(email) &&
        isPasswordValid(password) &&
        isFullNameValid(fullName);

    emit(state.copyWith(
      isBtnDisable: !isValid,
    ));
  }

  /// Handle email change
  emailChange(String email) {
    final updatedLoginLocal = state.signupLocal.copyWith(email: email);
    emit(state.copyWith(
      signupLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  /// Handle password change
  passwordChange(String password) {
    final updatedLoginLocal = state.signupLocal.copyWith(password: password);
    emit(state.copyWith(
      signupLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  fullNameChange(String fullName) {
    final updatedLoginLocal = state.signupLocal.copyWith(fullName: fullName);
    emit(state.copyWith(
      signupLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  confirmPasswordChange(String confirmPassword) {
    final updatedLoginLocal =
        state.signupLocal.copyWith(confirmPassword: confirmPassword);
    emit(state.copyWith(
      signupLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  void togglePassObscureText() {
    emit(
      state.copyWith(
        currentPasswordObscureText: !state.currentPasswordObscureText,
      ),
    );
  }

  void toggleConfirmPassObscureText() {
    emit(
      state.copyWith(
        confirmPasswordObscureText: !state.confirmPasswordObscureText,
      ),
    );
  }

  // Signup Method
  Future<void> signUp(String email, String password) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(state.copyWith(
        status: BaseStateStatus.success,
      ));
      DebugLog.i("UUID : ${userCredential.user!.uid}");
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failure,
      ));
      DebugLog.e("Login Error: $e");
    }
  }

  ///handle sign-up validation and call Firebase auth
  Future<void> signUpValidation(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      final email = state.emailController.text.trim();
      final password = state.passwordController.text.trim();
      final name = state.fullNameController.text.trim();

      DebugLog.i("Email: $email");
      DebugLog.i("Password: $password");
      DebugLog.i("Name: $name");

      await signUp(email, password);
    }
  }
}
