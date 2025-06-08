class CartItem {
  CartItem({
    required this.name,
    required this.image,
    required this.quantity,
    required this.inStock,
    required this.price,
  });

  final String name;
  final String image;
  final int quantity;
  final int price;
  final bool inStock;

  CartItem increase() {
    return CartItem(
      name: name,
      image: image,
      quantity: quantity + 1,
      inStock: inStock,
      price: price,
    );
  }

  CartItem decrease() {
    return CartItem(
      name: name,
      image: image,
      quantity: quantity > 1 ? quantity - 1 : 1,
      inStock: inStock,
      price: price,
    );
  }
}
