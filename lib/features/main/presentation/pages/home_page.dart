part of '_pages.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String name = 'Daniel'; // Nama
  final String npm = '2306220753'; // NPM
  final String className = 'PBP F'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage(
      "Lihat Daftar Product",
      Icons.shopping_bag,
      BaseColors.blue2,
    ),
    ItemHomepage(
      "Tambah Product",
      Icons.add,
      BaseColors.success,
    ),
    ItemHomepage(
      "Logout",
      Icons.logout,
      BaseColors.danger,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String time = DateTime.now().hour < 12
        ? 'Morning'
        : DateTime.now().hour < 18
            ? 'Afternoon'
            : DateTime.now().hour < 21
                ? 'Evening'
                : 'Night';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Celestia',
          style: FontTheme.poppins10w600white().copyWith(
            fontSize: 20,
          ),
        ),
        backgroundColor: BaseColors.furina3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: BaseColors.gray5,
                    backgroundImage: CachedNetworkImageProvider(
                      'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Good $time, ',
                          style: FontTheme.poppins16w700black(),
                          children: [
                            TextSpan(
                              text: name,
                              style: FontTheme.poppins16w700black().copyWith(
                                color: BaseColors.blue1,
                              ),
                            ),
                          ],
                        ),
                        style: FontTheme.poppins16w700black(),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$npm - $className',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GridView.count(
              primary: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((ItemHomepage item) {
                return ItemCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
