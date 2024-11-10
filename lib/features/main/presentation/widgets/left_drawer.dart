part of '_widgets.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: BaseColors.alabaster,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: BaseColors.furina3,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image(
                    image: AssetImage(Assets.image.logoHorizontal),
                    width: 150,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hoyoverse Merchandise\nStore",
                  textAlign: TextAlign.center,
                  style: FontTheme.poppins10w500white().copyWith(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 17.5,
                    vertical: 5,
                  ),
                  leading: const Icon(
                    Icons.home_outlined,
                    size: 32,
                  ),
                  title: Text(
                    'Home',
                    style: FontTheme.poppins14w600black(),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 17.5,
                    vertical: 5,
                  ),
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 32,
                  ),
                  title: Text(
                    'Add Product',
                    style: FontTheme.poppins14w600black(),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProductPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
