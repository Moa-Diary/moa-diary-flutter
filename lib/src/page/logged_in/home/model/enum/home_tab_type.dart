enum HomeTabType {
  home('홈', 'menu_home'),
  diaryList('일기목록', 'menu_diary'),
  emotion('감정통계', 'menu_emotion'),
  myPage('마이페이지', 'menu_mypage');

  final String description;
  final String iconName;

  const HomeTabType(
    this.description,
    this.iconName,
  );
}
