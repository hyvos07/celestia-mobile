part of '_widgets.dart';

class FormGameField extends StatelessWidget {
  const FormGameField({
    required this.gameController,
    super.key,
  });

  final TextEditingController gameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: gameController,
      minLines: 1,
      style: FontTheme.poppins12w400black(),
      cursorColor: BaseColors.furina3,
      decoration: InputDecoration(
        hintText: "Enter product's related game",
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
          gameController.text = '';
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        } else if (value.length > 255) {
          return "Character's related game is too long.";
        }
        return null;
      },
    );
  }
}
