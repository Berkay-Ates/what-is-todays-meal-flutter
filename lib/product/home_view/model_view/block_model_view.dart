import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_meal_frontend/product/home_view/service/service.dart';

import 'block_model_view_model.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(IMealService mealService)
      : _iMealService = mealService,
        super(const MealState());

  final IMealService _iMealService;

  Future<void> fetchMeal() async {
    emit(const MealState(isLoading: true));
    final response = await _iMealService.fetchMeals();
    inspect(response);
    emit(MealState(isLoading: false, mealsModel: response, isCompleted: response?.result != null));
  }
}
