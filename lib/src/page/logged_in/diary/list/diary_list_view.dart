import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/moa_diary_domain/diary/model/dto/diary_dto.dart';
import 'package:moa_diary_app/src/page/logged_in/diary/list/bloc/diary_list_bloc.dart';

import 'widget/widget.dart';

class DiaryListView extends StatefulWidget {
  const DiaryListView({Key? key}) : super(key: key);

  @override
  State<DiaryListView> createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView> {
  int _page = 0;
  List<DiaryDto> _diaryList = [];
  bool _hasMoreResult = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryListBloc, DiaryListState>(
      listener: _blocListener,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: DefaultAppBar(
              title: Text('일기목록'),
              showBackButton: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      tabs: const [
                        Tab(
                          child: Text(
                            '내 일기',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '일기 피드',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      isScrollable: true,
                    ),
                  ),
                ),
              ),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) {
                final diary = _diaryList[index];

                return DiaryListTile(
                  imageUrls: diary.imageUrls,
                  userName: '익명 01',
                  title: diary.title,
                  content: diary.content,
                  likeCount: diary.likeCount,
                  commentCount: diary.commentCount,
                  isPublic: diary.isPublic,
                  hashTags: diary.hashTags,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 8,
                  color: Color(0xFFF8F8F8),
                );
              },
              itemCount: _diaryList.length,
            ),
          ),
        );
      },
    );
  }

  void _blocListener(
    BuildContext context,
    DiaryListState state,
  ) async {
    if (state is DiaryListStateUpdateDiaryList) {
      _diaryList = state.diaryList;
      _page = state.page;
      _hasMoreResult = state.hasMoreResult;
    }
  }
}
