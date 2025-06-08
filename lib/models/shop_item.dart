class ShopItem {
  ShopItem({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  final String image;
  final String name;
  final int price;
  final List<String> description;
}
