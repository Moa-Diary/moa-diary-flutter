import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_in/bloc/sign_in_page_bloc.dart';

class SignInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInViewState();
  }
}

class _SignInViewState extends State<SignInView> {
  final _idTextController = TextEditingController();
  final _pwTextController = TextEditingController();

  @override
  void dispose() {
    _idTextController.dispose();
    _pwTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInPageBloc, SignInPageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/icon/logo.svg',
                  width: 105,
                ),
                const SizedBox(height: 16),
                const Text(
                  'MOAI',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 137,
                ),
                TextField(
                  controller: _idTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                      ),
                    ),
                    hintText: '아이디 (이메일)',
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _pwTextController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                      ),
                    ),
                    hintText: '비밀번호',
                  ),
                ),
                const SizedBox(height: 34),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                      onPressed: () {
                        _onSignInButtonPressed();
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: const Text(
                        '로그인',
                      )),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        '아이디 찾기  |  ',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        '비밀번호 찾기  |  ',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: const Text(
                      '구글 로그인',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _blocListener(
    BuildContext context,
    SignInPageState state,
  ) {
    if (state is SignInStateShowSnackBar) {
      ErrorSnackBar.show(context, state.message);
      return;
    }
  }

  void _onSignInButtonPressed() {
    context.read<SignInPageBloc>().add(SignInEventSignInRequested(
          email: _idTextController.text,
          password: _pwTextController.text,
        ));
  }
}
