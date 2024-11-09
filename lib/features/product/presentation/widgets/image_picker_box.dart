part of '_widgets.dart';

class ImagePickerBox extends StatelessWidget {
  const ImagePickerBox({
    required this.onTapUpload,
    this.isImageSizeTooBig,
    super.key,
  });

  final VoidCallback onTapUpload;
  final bool? isImageSizeTooBig;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: onTapUpload,
        child: DottedBorder(
          dashPattern: const [10],
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          color: BaseColors.furina1,
          strokeWidth: 1.5,
          child: SizedBox(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Gambar',
                  style: FontTheme.poppins14w700black().copyWith(
                    color: BaseColors.furina4,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jpeg/Png/Jpg Max 5 MB',
                          style: FontTheme.poppins10w400black(),
                        ),
                        Text(
                          '*',
                          style: FontTheme.poppins10w400black()
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    if (isImageSizeTooBig != null && isImageSizeTooBig!)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Gambar melebihi ukuran maksimal!',
                          style: FontTheme.poppins10w500black().copyWith(
                            color: BaseColors.danger,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
