import 'package:flutter/material.dart';
import 'package:menu_repository/menu_repository.dart';
import 'package:qnips_probeaufgabe/src/core/constants.dart';
import 'package:qnips_probeaufgabe/src/menu/models/product.dart';
import 'package:qnips_probeaufgabe/src/menu/widgets/menu_tile.dart';

class MenuTable extends StatelessWidget {
  const MenuTable({
    Key? key,
    this.weekday,
    required this.menu,
  }) : super(key: key);

  final Menu menu;
  final int? weekday;

  Product _getProductFromMenuRow(row, weekday) {
    final product = menu.products.firstWhere((product) =>
        product.productId == row.days[weekday].productIds.first.values.first);

    return Product(
      name: product.name,
      price: product.price['Betrag'],
      allergens: menu.allergens
          .where((allergen) => product.allergenIds.contains(allergen.id))
          .map((e) => e.label)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      child: Table(
          border: TableBorder.all(color: tableBorderColor),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
          },
          children: [
            // Header row
            if (!isMobile)
              TableRow(
                  decoration: const BoxDecoration(color: tableHeaderColor),
                  children: [
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'KW X',
                      ),
                    )),
                    for (int i = 0; i < daysToDisplay; i++)
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          weekdays[i],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )),
                  ]),
            // Regular row
            for (final row in menu.menuRows)
              TableRow(children: [
                // Category column
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: Container(
                    color: tableHeaderColor,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )),
                  ),
                ),
                if (!isMobile)
                  for (int day = 0; day < daysToDisplay; day++)
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: MenuTile(
                        product: _getProductFromMenuRow(row, day),
                      ),
                    ),
                if (isMobile)
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: MenuTile(
                      product: _getProductFromMenuRow(row, weekday),
                    ),
                  ),
              ]),
          ]),
    );
  }
}
