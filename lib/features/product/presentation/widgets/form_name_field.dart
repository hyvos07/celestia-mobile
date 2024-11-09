part of '_widgets.dart';

class FormNameField extends StatelessWidget {
  const FormNameField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      minLines: 1,
      style: FontTheme.poppins12w400black(),
      cursorColor: BaseColors.furina3,
      decoration: InputDecoration(
        hintText: 'Enter product name',
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
          nameController.text = '';
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        } else if (value.length > 255) {
          return 'Name is too long.';
        }
        return null;
      },
    );
  }
}
