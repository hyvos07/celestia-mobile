part of '_widgets.dart';

class FormStockField extends StatelessWidget {
  const FormStockField({
    required this.stockController,
    super.key,
  });

  final TextEditingController stockController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: stockController,
          minLines: 1,
          style: FontTheme.poppins12w400black(),
          cursorColor: BaseColors.furina3,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            hintText: 'Enter product stock',
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
          ),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            if (value.trim().isEmpty) {
              stockController.text = '';
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            } else if (int.tryParse(value) == null) {
              return 'Not a valid number.';
            } else if (int.parse(value) < 0) {
              return 'Stock cannot be negative.';
            }

            return null;
          },
        ),
        Positioned(
          top: 6,
          right: 2,
          child: SizedBox(
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  radius: 30,
                  onTap: () {
                    final int currentValue =
                        int.tryParse(stockController.text) ?? 0;
                    stockController.text = max(0, currentValue + 1).toString();
                  },
                  child: SvgPicture.asset(
                    Assets.svg.chevronCompactUp,
                    width: 15,
                    height: 15,
                  ),
                ),
                const SizedBox(height: 6),
                InkWell(
                  radius: 30,
                  onTap: () {
                    final int currentValue =
                        int.tryParse(stockController.text) ?? 0;
                    stockController.text = max(0, currentValue - 1).toString();
                  },
                  child: SvgPicture.asset(
                    Assets.svg.chevronCompactDown,
                    width: 15,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
