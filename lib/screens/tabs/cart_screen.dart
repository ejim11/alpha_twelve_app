import 'package:alpha_twelve_app/providers/cart_provider.dart';
import 'package:alpha_twelve_app/screens/tabs/tabs.dart';
import 'package:alpha_twelve_app/widgets/cart/cart_item_card_list.dart';
import 'package:alpha_twelve_app/widgets/home/address_and_searchbox_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.only(top: safeAreaTopPadding),
          child: Column(
            children: [
              AddressAndSearchBoxContainer(
                backBtnText: 'Your Cart',
                backBtnFunction: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => TabsScreen()));
                },
              ),
              CartItemCardList(items: cartItems),
            ],
          ),
        ),
      ),
    );
  }
}
