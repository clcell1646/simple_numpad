import 'package:flutter/material.dart';

/// A simple numpad.
class SimpleNumpad extends StatelessWidget {
  const SimpleNumpad({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    this.gridSpacing = 2,
    required this.onPressed,
    this.optionText,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.buttonBorderSide = BorderSide.none,
    this.buttonBorderRadius = 0,
    this.useBackspace = false,
    this.backspaceSize = 24,
    this.removeBlankButton = false,
  });

  /// Button width.
  final double buttonWidth;

  /// Button height.
  final double buttonHeight;

  /// Spacing of buttons.
  final double gridSpacing;

  /// Button event handle function.
  final Function(String) onPressed;

  /// Bottom left button text.
  final String? optionText;

  /// Text style.
  final TextStyle textStyle;

  /// Button foreground color.
  final Color foregroundColor;

  /// Button background color.
  final Color backgroundColor;

  /// Button border side.
  final BorderSide buttonBorderSide;

  /// Button border radius.
  final double buttonBorderRadius;

  /// Use bottom right backspace option.
  final bool useBackspace;

  /// Bottom right backspace
  final double backspaceSize;

  /// Remove blank button option.
  /// If you turn on this option,
  /// Deactivated bottom left and right buttons buttons will be removed.
  final bool removeBlankButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth * 3 + gridSpacing * 2,
      child: GridView.count(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: gridSpacing,
        mainAxisSpacing: gridSpacing,
        shrinkWrap: true,
        childAspectRatio: buttonWidth / buttonHeight,
        children: [
          _padTextButton("1"),
          _padTextButton("2"),
          _padTextButton("3"),
          _padTextButton("4"),
          _padTextButton("5"),
          _padTextButton("6"),
          _padTextButton("7"),
          _padTextButton("8"),
          _padTextButton("9"),
          optionText != null ? _padTextButton(optionText!) : _padDummyButton(),
          _padTextButton("0"),
          useBackspace ? _padImageButton() : _padDummyButton(),
        ],
      ),
    );
  }

  /// 플랫 버튼 반환
  Widget _flatButton(
    Widget child,
    VoidCallback onPressed,
  ) {
    return OutlinedButton(
      clipBehavior: Clip.antiAlias,
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(
          double.maxFinite,
          double.maxFinite,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: buttonBorderSide,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            buttonBorderRadius,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }

  /// 가짜 버튼
  Widget _padDummyButton() {
    if (removeBlankButton) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        border: Border.all(
          color: buttonBorderSide.color,
          strokeAlign: buttonBorderSide.strokeAlign,
          style: buttonBorderSide.style,
          width: buttonBorderSide.width,
        ),
      ),
    );
  }

  /// 텍스트 버튼 반환
  Widget _padTextButton(String text) {
    return _flatButton(
      Text(
        text,
        style: textStyle,
      ),
      () => onPressed(text),
    );
  }

  /// 이미지 버튼 반환
  Widget _padImageButton() {
    return _flatButton(
      _backspaceSvg(),
      () => onPressed('BACKSPACE'),
    );
  }

  /// 백스페이스 이미지 반환
  Widget _backspaceSvg() {
    return Image.asset(
      'packages/simple_numpad/assets/icon/ic_backspace.png',
      width: backspaceSize,
      color: textStyle.color,
    );
  }
}
