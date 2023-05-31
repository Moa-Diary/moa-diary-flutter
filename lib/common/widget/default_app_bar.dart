import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    required this.title,
    this.onBackButtonPressed,
    this.actions,
  });

  final Widget title;
  final VoidCallback? onBackButtonPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icon/ic_back.svg'),
        onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
      ),
      actions: actions ?? [],
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFF333333),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
