import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    super.key,
    required super.title,
    this.onBackButtonPressed,
    this.showBackButton = true,
    super.actions,
    super.bottom,
  }) : super(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0.5,
          toolbarTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF333333),
          ),
          titleSpacing: showBackButton ? null : 30,
          leading: showBackButton ? const _DefaultBackButton() : null,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF333333),
          ),
          toolbarHeight: 60,
        );

  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
}

class _DefaultBackButton extends StatelessWidget {
  const _DefaultBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset('assets/icon/ic_back.svg'),
      onPressed: () => Navigator.pop(context),
    );
  }
}
