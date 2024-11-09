part of '_widgets.dart';

class FormPriceField extends StatelessWidget {
  const FormPriceField({
    required this.priceController,
    super.key,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: priceController,
      minLines: 1,
      style: FontTheme.poppins12w400black(),
      cursorColor: BaseColors.furina3,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        hintText: 'Enter product price',
        hintStyle: FontTheme.poppins12w400black().copyWith(
          color: BaseColors.gray2.withOpacity(0.9),
        ),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: BaseColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: BaseColors.gray3.withOpacity(0.5),
            width: 0.9,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: BaseColors.furina1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 0.9),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 0.9),
        ),
        suffix: Text(
          'IDR',
          style: FontTheme.poppins12w400black().copyWith(
            color: BaseColors.gray3,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.trim().isEmpty) {
          priceController.text = '';
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        } else if (int.tryParse(value) == null) {
          return 'Not a valid number.';
        } else if (int.parse(value) < 0) {
          return 'Price cannot be negative.';
        }

        return null;
      },
    );
  }
}
