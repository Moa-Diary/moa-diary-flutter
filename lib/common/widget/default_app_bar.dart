import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key,
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
      centerTitle: false,
      backgroundColor: Colors.white,
      title: title,
      elevation: 0.0,
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
      bottom: _AppBarDivider(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarDivider extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xFFDDDDDD),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
