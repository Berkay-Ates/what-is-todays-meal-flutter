import 'dart:io';
import 'package:dio/dio.dart';
import 'package:what_is_meal_frontend/product/home_view/model/meal_model.dart';

class MasterService<T extends IMealService> {
  final T? _service;
  MasterService(T service) : _service = service;
  Future<void> getElements() async {
    print(_service?.url);
  }
}

abstract class IMealService {
  IMealService(this._dio);
  final Dio _dio;
  final String url = 'https://mealcalender.herokuapp.com/api/v1/ytu-meals/meals';

  Future<MealsModel?> fetchMeals();
}

class GetChefSpecial extends IMealService {
  GetChefSpecial(super.dio);

  @override
  Future<MealsModel?> fetchMeals() {
    throw UnimplementedError();
  }
}

class GetMeals extends IMealService {
  GetMeals(super.dio);
  @override
  Future<MealsModel?> fetchMeals() async {
    try {
      final result = await _dio.get(url);
      if (result.statusCode == HttpStatus.ok) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return MealsModel.fromJson(data);
        }
      }
    } on Exception catch (e) {
      throw MealServiceError<GetMeals>(GetMeals(_dio), e.toString());
    }
    return null;
  }
}

class MealServiceError<T extends IMealService> implements Exception {
  MealServiceError(this.instance, this.e);
  final T? instance;
  final String? e;

  @override
  String toString() {
    return 'Error is  $e, the error accoured in $instance';
  }
}
