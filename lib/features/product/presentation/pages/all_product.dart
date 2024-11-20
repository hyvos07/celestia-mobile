part of '_pages.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  Future<List<ProductModel>> fetchMood(CookieRequest request) async {
    final response = await request.get(Endpoints.json);
    var data = response;
    List<ProductModel> products = [];
    for (var d in data) {
      if (d != null) {
        products.add(ProductModel.fromJson(d["fields"]));
      }
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: BaseColors.alabaster,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColors.furina3,
        title: Text(
          'All Product',
          style: FontTheme.poppins18w500white(),
        ),
        iconTheme: const IconThemeData(color: BaseColors.white),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Text(
                    'Belum ada produk\nyang ditambahkan.',
                    style: FontTheme.poppins16w500black(),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: snapshot.data![index],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
