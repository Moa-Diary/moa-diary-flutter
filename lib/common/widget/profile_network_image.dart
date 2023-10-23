import 'package:flutter/material.dart';

class ProfileNetworkImage extends StatelessWidget {
  const ProfileNetworkImage({
    Key? key,
    required this.src,
    this.size = 48,
  }) : super(key: key);

  final String src;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        src,
        width: size,
        height: size,
        fit: BoxFit.fill,
      ),
    );
  }
}
