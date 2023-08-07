import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class favouriteMealsNotifier extends StateNotifier<List<Meal>> {
  favouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsfavorite = state.contains(meal);

    if(mealIsfavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<favouriteMealsNotifier, List<Meal>>((ref) {
  return favouriteMealsNotifier();
}); 