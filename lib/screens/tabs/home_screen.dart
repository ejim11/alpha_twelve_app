import 'package:alpha_twelve_app/widgets/home/address_and_searchbox_container.dart';
import 'package:alpha_twelve_app/widgets/home/shop_items.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double safeAreaTopPadding = MediaQuery.of(context).padding.top;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.only(top: safeAreaTopPadding),
      child: Column(
        children: [
          AddressAndSearchBoxContainer(
            isSearchInputVisible: true,
            backBtnText: 'Technology',
            backBtnFunction: () {},
          ),
          const ShopItems(),
        ],
      ),
    );
  }
}
