part of '_widgets.dart';

class URLToggle extends StatefulWidget {
  const URLToggle({
    required this.onToggle,
    required this.isFile,
    super.key,
  });

  final VoidCallback? onToggle;
  final bool? isFile;

  @override
  State<URLToggle> createState() => _URLToggleState();
}

class _URLToggleState extends State<URLToggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onToggle,
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          color: widget.isFile! ? BaseColors.furina3 : BaseColors.mineShaft,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: 2.5,
              left: widget.isFile! ? 50 : 5,
              right: widget.isFile! ? 5 : 50,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 7,
              child: AnimatedOpacity(
                opacity: widget.isFile! ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'IMG',
                  style: FontTheme.poppins14w600black().copyWith(
                    color: BaseColors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 7,
              child: AnimatedOpacity(
                opacity: widget.isFile! ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'URL',
                  style: FontTheme.poppins14w600black().copyWith(
                    color: BaseColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
