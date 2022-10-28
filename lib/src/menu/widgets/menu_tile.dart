import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/src/menu/models/product.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < product.allergens.length - 1; i++)
                  product.allergens[i].isNotEmpty
                      ? Text(
                          '${product.allergens[i]}, ',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      : const SizedBox.shrink(),
                Text(
                  product.allergens[product.allergens.length - 1],
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          Text(
            '${product.price}€',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
