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
    return Scaffold(
      backgroundColor: BaseColors.alabaster,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: BaseColors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
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
                      FormNameField(nameController: nameController),
                      const SizedBox(height: 24),
                      Text(
                        "Price",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormPriceField(priceController: priceController),
                      const SizedBox(height: 24),
                      Text(
                        "Description",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormDescField(
                          descriptionController: descriptionController),
                      const SizedBox(height: 24),
                      Text(
                        "Stock",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormStockField(stockController: stockController),
                      const SizedBox(height: 24),
                      Text(
                        "Character",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormCharaField(charaController: charaController),
                      const SizedBox(height: 24),
                      Text(
                        "Game",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormGameField(gameController: gameController),
                      const SizedBox(height: 24),
                      Text(
                        "Category",
                        style: FontTheme.poppins14w600black(),
                      ),
                      const SizedBox(height: 10),
                      FormCategoryField(categoryController: categoryController),
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
          _postButton(),
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
  Future<void> postProduct() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: BaseColors.alabaster,
          title: Text(
            'Product berhasil ditambahkan!',
            style: FontTheme.poppins12w600black().copyWith(
              fontSize: 16,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(nameController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Price:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(priceController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Description:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(descriptionController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Stock:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(stockController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Character:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(charaController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Game:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(gameController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Category:',
                        style: FontTheme.poppins12w600black(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(categoryController.text),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Image:',
                  style: FontTheme.poppins12w600black(),
                ),
                const SizedBox(height: 15),
                isUsingFile
                    ? _imagePreview(isModal: true)
                    : Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageUrlController.text.isNotEmpty
                                ? CachedNetworkImageProvider(
                                    imageUrlController.text,
                                  )
                                : const AssetImage(
                                    'assets/images/furina_sad.png',
                                  ) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: FontTheme.poppins12w600black().copyWith(
                  color: BaseColors.furina3,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
                setState(() {
                  nameController.clear();
                  priceController.clear();
                  descriptionController.clear();
                  stockController.clear();
                  charaController.clear();
                  gameController.clear();
                  categoryController.clear();
                  imageUrlController.clear();
                  imageFile = null;
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget _postButton() {
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
              postProduct();
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
