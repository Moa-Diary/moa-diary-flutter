import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';

class EmailDuplicateCheckButton extends StatelessWidget {
  const EmailDuplicateCheckButton({
    super.key,
    required this.isDuplicateChecked,
    required this.useEmailAvailable,
    required this.onPressed,
  });

  final bool isDuplicateChecked;
  final bool useEmailAvailable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: useEmailAvailable ? mainColor : const Color(0xFFFF4539),
          ),
        ),
        child: Text(
          isDuplicateChecked
              ? useEmailAvailable
                  ? '사용가능'
                  : '사용불가'
              : '중복확인',
          style: TextStyle(
            fontSize: 14,
            color: useEmailAvailable ? mainColor : const Color(0xFFFF4539),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
