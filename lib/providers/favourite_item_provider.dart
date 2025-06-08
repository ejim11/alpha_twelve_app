import "package:alpha_twelve_app/models/shop_item.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class FavouriteShopItemsNotifier extends StateNotifier<List<ShopItem>> {
  FavouriteShopItemsNotifier() : super([]);

  bool toggleShopItemFavouriteStatus(ShopItem item) {
    // check if the meal is a favourite
    final isFavourite = state.contains(item);

    if (isFavourite) {
      state = state.where((shopItem) => shopItem.name != item.name).toList();
      return false;
    } else {
      state = [...state, item];
      return true;
    }
  }
}

final favouriteShopItemsProvider =
    StateNotifierProvider<FavouriteShopItemsNotifier, List<ShopItem>>(
      (ref) => FavouriteShopItemsNotifier(),
    );
