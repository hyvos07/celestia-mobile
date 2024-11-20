part of '_widgets.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {super.key});

  final ItemHomepage item;

  void _onTap(BuildContext context) {
    if (item.name == "Tambah Produk") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddProductPage(),
        ),
      );
    } else if (item.name == "Lihat Produk Kamu") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AllProduct(),
        ),
      );
    } else if (item.name == "Logout") {
      // nanti
      ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Container(
            width: double.infinity,
            color: BaseColors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: Icon(
                    item.icon,
                    color: item.color,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 24, 14),
                    child: Text(
                      "Berhasil Logout!",
                      style: FontTheme.poppins12w500black(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 3,
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(42, 0, 42, 32),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => _onTap(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
