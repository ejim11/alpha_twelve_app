import 'package:alpha_twelve_app/data/shop_item_list.dart';
import 'package:alpha_twelve_app/screens/shop_item_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopItems extends StatelessWidget {
  const ShopItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Smartphones, Laptops & Assecories',
              style: GoogleFonts.ibmPlexMono(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7, // Starting point, adjust as needed
                ),
                clipBehavior: Clip.hardEdge,
                itemCount: shopItemList.length,
                itemBuilder: (context, index) {
                  final item = shopItemList[index];
                  return Card(
                    margin: EdgeInsets.zero,
                    color: Theme.of(context).colorScheme.surface,
                    elevation: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ShopItemDetail(
                                  shopItem: shopItemList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.17),
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.62),
                              ),
                            ),
                            height: 162,
                            child: Hero(
                              tag: item.name,
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                                placeholder: MemoryImage(kTransparentImage),
                                image: AssetImage(item.image),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        const SizedBox(height: 5.17),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
