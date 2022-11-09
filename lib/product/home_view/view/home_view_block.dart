import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_meal_frontend/product/home_view/model_view/block_model_view.dart';
import 'package:what_is_meal_frontend/product/home_view/service/service.dart';
import 'package:what_is_meal_frontend/product/home_view/service/singleton_dio.dart';

import '../model_view/block_model_view_model.dart';

class BlockHomeView extends StatefulWidget {
  const BlockHomeView({super.key});
  @override
  State<BlockHomeView> createState() => _BlockHomeViewState();
}

class _BlockHomeViewState extends State<BlockHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(GetMeals(SingletonDio.instance)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('home view'),
          actions: [
            BlocBuilder<MealCubit, MealState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context.read<MealCubit>().fetchMeal();
                    },
                    icon: const Icon(Icons.dinner_dining_outlined));
              },
            ),
          ],
        ),
        body: const Text(''),
      ),
    );
  }
}



/*
Expanded(
            child: BlocConsumer<MealCubit, MealState>(
          listener: (context, state) {
            context.read<MealCubit>().fetchMeal();
          },
          builder: (context, state) {
            return state.isLoading ?? true
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.mealsModel?.result?.length,
                    itemBuilder: (context, indx) => const Card(child: Text('data')));
          },
        ))
*/