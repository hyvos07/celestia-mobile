part of '_pages.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // Controllers for each form field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController(
    text: '1',
  );
  final TextEditingController charaController = TextEditingController();
  final TextEditingController gameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  // Optional: Image, with 2 options
  bool isUsingFile = true;
  final TextEditingController imageUrlController = TextEditingController();
  File? imageFile;
  bool? isImageSizeTooBig;

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: BaseColors.alabaster,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BaseColors.white,
        ),
        centerTitle: true,
        title: Text(
          'Add Product',
          style: FontTheme.poppins10w600white().copyWith(
            fontSize: 18,
          ),
        ),
        backgroundColor: BaseColors.furina3,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormNameField(
                        nameController: nameController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Price",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormPriceField(
                        priceController: priceController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Description",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormDescField(
                        descriptionController: descriptionController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Stock",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormStockField(
                        stockController: stockController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Character",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormCharaField(
                        charaController: charaController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Game",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormGameField(
                        gameController: gameController,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Category",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormCategoryField(
                        categoryController: categoryController,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Image",
                            style: FontTheme.poppins14w600black(),
                          ),
                          URLToggle(
                            onToggle: () {
                              setState(() {
                                isUsingFile = !isUsingFile;
                              });
                            },
                            isFile: isUsingFile,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: isUsingFile && imageFile == null,
                        child: ImagePickerBox(
                          onTapUpload: pickImage,
                          isImageSizeTooBig: isImageSizeTooBig,
                        ),
                      ),
                      Visibility(
                        visible: !isUsingFile,
                        child: FormImageUrlField(
                          imageUrlController: imageUrlController,
                        ),
                      ),
                      Visibility(
                        visible: isUsingFile && imageFile != null,
                        child: _imagePreview(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _postButton(request, context),
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedImg = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      final fileSizeInBytes = await pickedImg.length();
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB <= 5) {
        setState(() {
          imageFile = File(pickedImg.path);
          isImageSizeTooBig = false;
        });
      } else {
        setState(() {
          isImageSizeTooBig = true;
        });
      }
    }
  }

  // For now ini muncul dialog aja
  Future<void> postProduct(CookieRequest request, BuildContext context) async {
    final response = await request.postJson(
            Endpoints.create,
            jsonEncode(<String, String>{
                'name': nameController.text,
                'price': priceController.text,
                'description': descriptionController.text,
                'stock': stockController.text,
                'chara': charaController.text,
                'game': gameController.text,
                'category': categoryController.text,
                'image': imageUrlController.text, // For now URL aja
            }),
        );
        if (context.mounted) {
            if (response['status'] == 'Successfully added product') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                content: Text("Produk baru berhasil ditambahkan!"),
                ));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                );
            } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                    content:
                        Text("Terdapat kesalahan, silakan coba lagi."),
                ));
            }
        }
  }

  Widget _postButton(CookieRequest request, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: BaseColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: BaseColors.neutral100.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              postProduct(request, context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: BaseColors.furina3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Create Product',
            style: FontTheme.poppins10w600white().copyWith(
              color: BaseColors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePreview({bool isModal = false}) {
    if (isModal) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageFile != null
                ? FileImage(imageFile!)
                : const AssetImage(
                    'assets/images/furina_sad.png',
                  ) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageFile != null
                  ? FileImage(imageFile!)
                  : const AssetImage(
                      'assets/images/furina_sad.png',
                    ) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: GestureDetector(
            onTap: () {
              setState(() {
                imageFile = null;
              });
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: BaseColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close_rounded,
                color: BaseColors.furina1,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
