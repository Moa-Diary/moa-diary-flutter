enum HomeTabType {
  home('홈', 'ic_menu_home'),
  diaryList('일기목록', 'ic_menu_diary'),
  emotion('감정통계', 'ic_menu_emotion'),
  myPage('마이페이지', 'ic_menu_mypage');

  final String description;
  final String iconName;

  const HomeTabType(
    this.description,
    this.iconName,
  );
}
