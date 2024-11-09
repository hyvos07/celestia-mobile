part of '_widgets.dart';

/// Expandable text area field with draggable handle.
///
/// Taken from [Flutter resize TextField by dragging](https://stackoverflow.com/questions/57760312/flutter-resize-textfield-by-dragging)
/// with some modifications.
class TextArea extends StatefulWidget {
  final double height;
  final double maxHeight;
  final double dividerHeight;
  final double dividerSpace;
  final Widget child;

  const TextArea({
    required this.child,
    this.height = 200,
    this.maxHeight = 500,
    this.dividerHeight = 40,
    this.dividerSpace = 2,
    super.key,
  });

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  late double _height;
  late double _maxHeight;
  late double _dividerHeight;
  late double _dividerSpace;

  @override
  void initState() {
    super.initState();
    _height = widget.height;
    _maxHeight = widget.maxHeight;
    _dividerHeight = widget.dividerHeight;
    _dividerSpace = widget.dividerSpace;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 150,
                maxHeight: _height,
              ),
              child: widget.child,
            ),
            Positioned(
              top: _height - _dividerSpace - 48,
              right: 8,
              child: GestureDetector(
                child: SvgPicture.asset(
                  Assets.svg.textResize,
                ),
                onPanUpdate: (details) {
                  setState(() {
                    _height += details.delta.dy;

                    // prevent overflow if height
                    // is more/less than available space
                    final maxLimit =
                        _maxHeight - _dividerHeight - _dividerSpace;
                    const minLimit = 150.0;

                    if (_height > maxLimit) {
                      _height = maxLimit;
                    } else if (_height < minLimit) {
                      _height = minLimit;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
