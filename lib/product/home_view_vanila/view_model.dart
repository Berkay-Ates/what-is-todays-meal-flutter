import 'package:what_is_meal_frontend/product/home_view/service/singleton_dio.dart';
import 'package:what_is_meal_frontend/product/home_view_vanila/loading.dart';
import 'package:what_is_meal_frontend/product/home_view_vanila/view.dart';

import '../home_view/model/meal_model.dart';
import '../home_view/service/service.dart';

abstract class MealVanillaModelView extends Loading<HomeViewStatefull> {
  final IMealService _iMealService = GetMeals(SingletonDio.instance);
  List<Result?> results = [];

  Future<void> fetchMeal() async {
    changeLoading();
    results = (await _iMealService.fetchMeals())?.result ?? [];
    changeLoading();
  }
}
