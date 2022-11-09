// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:what_is_meal_frontend/product/home_view/model/meal_model.dart';

class MealState extends Equatable {
  final bool? isLoading;
  final MealsModel? mealsModel;
  final bool? isCompleted;

  const MealState({this.isLoading = false, this.mealsModel, this.isCompleted = false});

  @override
  List<Object?> get props => [isLoading, mealsModel];

  MealState copyWith({
    bool? isLoading,
    MealsModel? mealsModel,
    bool? isCompleted,
  }) {
    return MealState(
      isLoading: isLoading ?? false,
      mealsModel: mealsModel ?? this.mealsModel,
      isCompleted: isCompleted ?? false,
    );
  }
}
