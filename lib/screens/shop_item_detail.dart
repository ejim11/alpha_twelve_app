import 'package:alpha_twelve_app/models/shop_item.dart';
import 'package:alpha_twelve_app/widgets/home/address_and_searchbox_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopItemDetail extends StatefulWidget {
  const ShopItemDetail({super.key, required this.shopItem});

  final ShopItem shopItem;

  @override
  State<ShopItemDetail> createState() {
    return _ShopItemDetailState();
  }
}

class _ShopItemDetailState extends State<ShopItemDetail> {
  @override
  Widget build(BuildContext context) {
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
                backBtnText: 'Go Back',
                backBtnFunction: () {
                  Navigator.of(context).pop();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.shopItem.name,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5.17),
                              width: double.infinity,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 331,
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                                placeholder: MemoryImage(kTransparentImage),
                                image: AssetImage(widget.shopItem.image),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 14,
                            child: IconButton.filled(
                              style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(
                                  Size.square(44),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              color: Theme.of(context).colorScheme.onSurface,
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.heart),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.shopItem.name,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5.17),
                    Text(
                      '\$${widget.shopItem.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 32.75,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'About this item',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    for (String text in widget.shopItem.description)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '•  ',
                              style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(
                          const Size(double.infinity, 48),
                        ), // Full width
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Border radius of 8
                          ),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
