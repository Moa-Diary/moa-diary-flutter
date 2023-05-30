import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_in/home/bloc/home_page_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/home/widget/widget.dart';
import 'model/model.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  final _tabs = HomeTabType.values;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 3),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFDDDDDD),
                  width: 1,
                ),
              )
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: _tabs.map<BottomNavigationBarItem>((e) {
                if (_tabs[_selectedIndex] == e) {
                  return BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: SvgPicture.asset('assets/icon/${e.iconName}.svg',
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: e.description,
                  );
                }
                return BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset('assets/icon/${e.iconName}.svg'),
                  ),
                  label: e.description,
                );
              }).toList(),
              currentIndex: _selectedIndex,
              selectedItemColor: mainColor,
              onTap: (index) {
                _selectedIndex = index;
                setState(() {});
              },
              showUnselectedLabels: true,
              unselectedItemColor: const Color(0xFF999999),
              elevation: 0,
              selectedFontSize: 14,
              unselectedFontSize: 14,
            ),
          ),
          body: SafeArea(child: HomeTabView()),
        );
      },
    );
  }

  void _blocListener(
    BuildContext context,
    HomePageState state,
  ) {}
}
