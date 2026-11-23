import 'package:kasirku/cart.dart';
import 'package:kasirku/components/produk.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';
import 'package:kasirku/colors.dart';
import 'package:kasirku/components/components.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CatalogPage extends StatefulWidget {
  const new({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kasir')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: RegularFormInput(
              controller: searchController,
              hintText: 'Pencarian',
              icon: Icon(LucideIcons.search, size: 22),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 100),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return CardProduct();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.box,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 16,
                children: [
                  Icon(LucideIcons.shoppingCart, color: AppColors.white),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semiBold('4 pcs', color: AppColors.white),
                        RegularText.semiBold(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp ',
                          ).format(100000),
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  Icon(LucideIcons.chevronRight, color: AppColors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
