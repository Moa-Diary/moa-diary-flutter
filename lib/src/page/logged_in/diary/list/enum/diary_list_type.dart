enum DiaryListType {
  myDiary('내 일기'),
  diaryFeed('일기 피드');

  final String description;

  const DiaryListType(this.description);

  bool get isMyDiary => this == myDiary;

  bool get isDiaryFeed => this == diaryFeed;
}