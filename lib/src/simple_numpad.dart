import 'package:flutter/material.dart';

class SimpleNumpad extends StatelessWidget {
  const SimpleNumpad({
    super.key,
    required this.numpadWidth,
    required this.numpadHeight,
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
    this.backspaceSize = 24,
    this.gridSpacing = 2,
  });

  final double numpadWidth;
  final double numpadHeight;
  final Function(String) onPressed;
  final String? optionText;
  final TextStyle textStyle;
  final Color foregroundColor;
  final Color backgroundColor;
  final BorderSide buttonBorderSide;
  final double buttonBorderRadius;
  final double backspaceSize;
  final double gridSpacing;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = (numpadWidth - 4) / 3;
    final double buttonHeight = (numpadHeight - 6) / 4;
    return SizedBox(
      width: numpadWidth,
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
          optionText == null ? _padDummyButton() : _padTextButton(optionText!),
          _padTextButton("0"),
          _padImageButton(),
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
