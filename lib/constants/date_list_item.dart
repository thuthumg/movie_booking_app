class DateListItem {
  final String weekName;
  final String monthName;
  final String dayStr;
  final String dateTimeStr;
  bool isSelected;

  DateListItem(
      this.weekName,
      this.monthName,
      this.dayStr,
      this.dateTimeStr,
      {this.isSelected = false});

}