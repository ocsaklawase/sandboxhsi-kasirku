import 'package:material_ui/material_ui.dart';
import 'package:kasirku/colors.dart';
import 'package:kasirku/components/components.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Pesanan')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                SubtitleText(text: 'Pesanan'),
                InkWell(
                  child: SubtitleText(
                    text: '+ Diskon',
                    color: AppColors.primary,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Divider(),
            _buildPesanan(),
            Divider(),
            SubtitleText(text: 'Detail Transaksi'),
            Divider(),
            Column(
              spacing: 8,
              children: [
                _buildTile(title: 'Jumlah pesanan', value: '4'),
                _buildTile(title: 'Subtotal', value: 'Rp 100.000'),
                _buildTile(title: 'Pajak', value: 'Rp 0'),
                _buildTile(title: 'Diskon', value: 'Rp 0'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                RegularText.semiBold('Estimasi Tagihan'),
                RegularText.semiBold('Rp 100.000'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Batalkan',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Draft',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 12,
                            children: [
                              RegularText.semiBold('Metode Pembayaran'),
                              Divider(),
                              ListTile(
                                leading: Icon(LucideIcons.creditCard),
                                title: RegularText(text: 'Kartu Kredit'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(LucideIcons.wallet),
                                title: RegularText(text: 'Dompet Digital'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(LucideIcons.dollarSign),
                                title: RegularText(text: 'Tunai'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Lanjutkan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 12,
      children: [
        RegularText(text: title),
        RegularText.semiBold(value),
      ],
    );
  }

  Widget _buildPesanan() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          spacing: 12,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: .3),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://ui-avatars.com/api/?name=Kopi+Aren&background=random',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  RegularText.semiBold('Kopi Aren'),
                  RegularText(text: '25.000 / pcs'),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(LucideIcons.squareMinus, color: AppColors.primary),
            ),
            RegularText.semiBold('4'),
            InkWell(
              onTap: () {},
              child: Icon(LucideIcons.squarePlus, color: AppColors.primary),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 12);
      },
      itemCount: 1,
    );
  }
}
