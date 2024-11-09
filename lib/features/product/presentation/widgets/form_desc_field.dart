part of '_widgets.dart';

class FormDescField extends StatelessWidget {
  const FormDescField({
    required this.descriptionController,
    super.key,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextArea(
      child: TextFormField(
        maxLines: 100,
        controller: descriptionController,
        style: FontTheme.poppins12w400black(),
        decoration: InputDecoration(
          hintText: 'Enter product description',
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
        // Walaupun database bisa unlimited, buat di sini max 1000 aja
        maxLength: 1000,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          required maxLength,
        }) {
          return Container(
            transform: Matrix4.translationValues(12, 0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '$currentLength/$maxLength',
                style: FontTheme.poppins12w600black().copyWith(
                  color: BaseColors.furina1,
                ),
              ),
            ),
          );
        },
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Description cannot be empty.';
          }
          return null;
        },
      ),
    );
  }
}
