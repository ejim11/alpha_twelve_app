import 'package:alpha_twelve_app/models/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    final existingItemIndex = state.indexWhere(
      (cartItem) => cartItem.name == item.name,
    );

    if (existingItemIndex >= 0) {
      state = [
        for (int i = 0; i < state.length; i++)
          i == existingItemIndex ? state[i].increase() : state[i],
      ];
    } else {
      state = [...state, item];
    }
  }

  void increaseQuantity(String name) {
    state = [
      for (final item in state) item.name == name ? item.increase() : item,
    ];
  }

  void decreaseQuantity(String name) {
    state = [
      for (final item in state) item.name == name ? item.decrease() : item,
    ];
  }

  void deleteItem(String name) {
    state = state.where((item) => item.name != name).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
