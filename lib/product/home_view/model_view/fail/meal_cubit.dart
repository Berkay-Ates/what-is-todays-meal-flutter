import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/service.dart';
import 'cubit_state.dart';

class MealCubit extends Cubit<MealsState> {
  MealCubit(this._iMealService) : super(const MealInitial());
  final IMealService _iMealService;

  Future<void> getMeals(args) async {
    try {
      emit(const MealLoading());
      final response = await _iMealService.fetchMeals();
      emit(MealCompleted(response));
    } on MealServiceError catch (e) {
      emit(MealError(e.e ?? 'there must be some error'));
    }
  }
}
