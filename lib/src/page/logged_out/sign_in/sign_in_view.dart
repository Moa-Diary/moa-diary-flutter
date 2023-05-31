import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_in/home/home_page.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_in/bloc/sign_in_page_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

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
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  SvgPicture.asset(
                    'assets/icon/ic_logo.svg',
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
                    height: 10,
                  ),
                  const Text(
                    '모두의 일기를 도와주는 AI',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF777777),
                    ),
                  ),
                  const SizedBox(
                    height: 137,
                  ),
                  DefaultTextField(
                    controller: _idTextController,
                    hintText: '아이디 (이메일)',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 40),
                  DefaultTextField(
                    controller: _pwTextController,
                    hintText: '비밀번호',
                    obscureText: true,
                  ),
                  const SizedBox(height: 34),
                  DefaultElevatedButton(
                    onPressed: _onSignInButtonPressed,
                    child: const Text(
                      '로그인하기',
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _onGoogleButtonPressed,
                        child: Container(
                          width: 54,
                          height: 54,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/image/img_google.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 54,
                        height: 54,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/image/img_apple.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
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
    if (state is SignInStateSignInSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        HomePage.route(),
        (route) => false,
      );
      return;
    }
  }

  void _onSignInButtonPressed() {
    context.read<SignInPageBloc>().add(SignInEventSignInRequested(
          email: _idTextController.text,
          password: _pwTextController.text,
        ));
  }

  void _onGoogleButtonPressed() {
    context.read<SignInPageBloc>().add(SignInEventGoogleSignInRequested());
  }
}
