import 'package:alpha_twelve_app/providers/cart_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.inStock,
  });

  final String name;
  final String image;
  final int price;
  final int quantity;
  final bool inStock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void increaseQty(String name) {
      ref.read(cartProvider.notifier).increaseQuantity(name);
    }

    void decreaseQty(String name) {
      ref.read(cartProvider.notifier).decreaseQuantity(name);
    }

    void removeItemFromcart(String name) {
      ref.read(cartProvider.notifier).deleteItem(name);
    }

    // print(image);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 100, height: 100),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 2,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  '\$${(quantity * price).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 2,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  'In stock',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color.fromRGBO(16, 185, 129, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton.filled(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size.square(44)),
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(226, 232, 240, 1),
                        ),
                      ),
                      color: Theme.of(context).colorScheme.onSurface,
                      onPressed: () {
                        decreaseQty(name);
                      },
                      icon: Icon(FeatherIcons.minus),
                    ),
                    const SizedBox(width: 16),
                    Text(quantity.toString()),
                    const SizedBox(width: 16),
                    IconButton.filled(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size.square(44)),
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.onSurface,
                      onPressed: () {
                        increaseQty(name);
                      },
                      icon: Icon(FeatherIcons.plus),
                    ),
                    Spacer(),
                    IconButton.filled(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size.square(44)),
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.onSurface,
                      onPressed: () {
                        removeItemFromcart(name);
                      },
                      icon: Image.asset('assets/cart/delete-icon.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
