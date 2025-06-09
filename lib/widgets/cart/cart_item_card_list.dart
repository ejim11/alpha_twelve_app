import 'package:alpha_twelve_app/models/cart_item.dart';
import 'package:alpha_twelve_app/widgets/cart/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItemCardList extends StatelessWidget {
  const CartItemCardList({super.key, required this.items});

  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    final int subTotal = items.isNotEmpty
        ? items.fold(0, (total, item) => total + (item.price * item.quantity))
        : 0;

    if (items.isEmpty) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Text(
            'No items added to cart',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            primary: false,
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (ctx, index) => CartItemCard(
              name: items[index].name,
              image: items[index].image,
              price: items[index].price,
              quantity: items[index].quantity,
              inStock: items[index].inStock,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Order Info',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                '\$${formatter.format(subTotal).toString()}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Shipping',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                '\$10',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                '\$${formatter.format(subTotal + 10)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          FilledButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                const Size(double.infinity, 48),
              ), // Full width
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Border radius of 8
                ),
              ),
            ),
            child: Text(
              'Checkout (\$${formatter.format(subTotal + 10)})',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
