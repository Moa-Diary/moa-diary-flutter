import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_up/bloc/sign_up_page_bloc.dart';

import 'widget/widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpViewState();
  }
}

class _SignUpViewState extends State<SignUpView> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _pwTextController = TextEditingController();
  final _pwConfirmTextController = TextEditingController();
  final _scrollController = ScrollController();

  bool _isDuplicateChecked = false;
  bool _useEmailAvailable = true;

  bool _hasFocus = false;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _pwTextController.dispose();
    _pwConfirmTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpPageBloc, SignUpPageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Focus(
          onFocusChange: (focus) {
            _hasFocus = focus;
          },
          child: GestureDetector(
            onTap: () {
              setState(() {
                FocusScope.of(context).unfocus();
              });
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: const DefaultAppBar(
                title: Text('회원가입'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextFieldLabel(text: '이름'),
                            DefaultTextField(
                              controller: _nameTextController,
                              hintText: '이름을 적어주세요.',
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const TextFieldLabel(text: '이메일'),
                            Row(
                              children: [
                                Expanded(
                                  child: DefaultTextField(
                                    controller: _emailTextController,
                                    hintText: '이메일을 작성해주세요.',
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: _onEmailChanged,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                EmailDuplicateCheckButton(
                                  isDuplicateChecked: _isDuplicateChecked,
                                  useEmailAvailable: _useEmailAvailable,
                                  onPressed: _onDuplicateCheckButtonPressed,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const TextFieldLabel(text: '비밀번호'),
                            DefaultTextField(
                              controller: _pwTextController,
                              obscureText: true,
                              hintText: '비밀번호를 작성해주세요.',
                            ),
                            DefaultTextField(
                              controller: _pwConfirmTextController,
                              obscureText: true,
                              hintText: '비밀번호 확인',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible: !_hasFocus,
                      child: DefaultElevatedButton(
                        onPressed: _onCompleteButtonPressed,
                        child: const Text('완료'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _blocListener(
    BuildContext context,
    SignUpPageState state,
  ) {
    if (state is SignUpStateDuplicateCheckSuccess) {
      _isDuplicateChecked = true;
      _useEmailAvailable = state.useEmailAvailable;
      return;
    }
    if (state is SignUpStateShowSnackBar) {
      ErrorSnackBar.show(context, state.message);
      return;
    }
    if (state is SignUpStateSuccess) {
      SuccessSnackBar.show(context, '회원가입이 완료되었습니다.');
      Navigator.pop(context);
      return;
    }
  }

  void _onCompleteButtonPressed() {
    context.read<SignUpPageBloc>().add(SignUpEventCompleteButtonPressed(
          name: _nameTextController.text,
          email: _emailTextController.text,
          password: _pwTextController.text,
          passwordConfirm: _pwConfirmTextController.text,
          isDuplicateChecked: _isDuplicateChecked,
          isEmailAvailable: _useEmailAvailable,
        ));
  }

  void _onDuplicateCheckButtonPressed() {
    if (!_isDuplicateChecked) {
      context.read<SignUpPageBloc>().add(SignUpEventDuplicateCheckButtonPressed(
            email: _emailTextController.text,
          ));
    }
  }

  void _onEmailChanged(String? text) {
    if (_isDuplicateChecked) {
      setState(() {
        _isDuplicateChecked = false;
        _useEmailAvailable = true;
      });
    }
  }
}
