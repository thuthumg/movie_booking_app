class DateListItem {
  final String weekName;
  final String monthName;
  final String dayStr;
  bool isSelected;

  DateListItem(
      this.weekName,
      this.monthName,
      this.dayStr,
      {this.isSelected = false});

}