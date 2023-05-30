import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            '오늘까지 쌓인',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Text(
                '내 일기 88개',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 187,
                height: 9,
                color: const Color(0x33FFB812),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '하진님, 오늘도 함께 이야기해요!',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset('assets/icon/home_character.png',),
              ),
              DefaultElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('일기 쓰러가기'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
