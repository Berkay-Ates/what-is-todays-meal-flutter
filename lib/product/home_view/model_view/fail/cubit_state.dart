// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:what_is_meal_frontend/product/home_view/model/meal_model.dart';

abstract class MealsState {
  const MealsState();
}

class MealInitial extends MealsState {
  const MealInitial();
}

class MealLoading extends MealsState {
  const MealLoading();
}

class MealCompleted extends MealsState {
  final MealsModel? mealsModel;

  MealCompleted(this.mealsModel);

  @override
  bool operator ==(covariant MealCompleted other) {
    if (identical(this, other)) return true;

    return other.mealsModel == mealsModel;
  }

  @override
  int get hashCode => mealsModel.hashCode;
}

class MealError extends MealsState {
  const MealError(this.error);
  final String error;
}
