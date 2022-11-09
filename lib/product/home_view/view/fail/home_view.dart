import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_meal_frontend/product/home_view/service/service.dart';
import 'package:what_is_meal_frontend/product/home_view/service/singleton_dio.dart';

import '../../model_view/fail/cubit_state.dart';
import '../../model_view/fail/meal_cubit.dart';

class MealHomeView extends StatefulWidget {
  const MealHomeView({super.key});
  @override
  State<MealHomeView> createState() => _MealHomeViewState();
}

class _MealHomeViewState extends State<MealHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('meal view')),
      floatingActionButton: BlocProvider(
        create: (context) => MealCubit(GetMeals(SingletonDio.instance)),
        child: FloatingActionButton(onPressed: (() {})),
      ),
      body: BlocConsumer<MealCubit, MealsState>(
        listener: (context, state) {
          if (state is MealError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is MealInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MealLoading) {
          } else if (state is MealCompleted) {
          } else {
            return const Text('data');
          }
          return const Text('data');
        },
      ),
    );
  }
}
