import 'dart:core';
import 'spreadsheet.dart' as spreadsheet;

String getCurrentDayRange() {
  DateTime now = new DateTime.now();
  switch(now.weekday) {
    case DateTime.MONDAY:
      return 'B23:B48';
    case DateTime.TUESDAY:
      return 'C23:C48';
    case DateTime.WEDNESDAY:
      return 'D23:D48';
    case DateTime.THURSDAY:
      return 'E23:E48';
    case DateTime.FRIDAY:
      return 'F23:F48';
  }
}

extractNeededInformation() {
  spreadsheet.getSegraInfoFromRange(getCurrentDayRange());
}

Map createSegraOrderMap() {
  Map segraOrderMap = new Map<String, int>();
  segraOrderMap['A1'] = 0;
  segraOrderMap['A2'] = 0;
  segraOrderMap['A3'] = 0;
  segraOrderMap['A4'] = 0;
  segraOrderMap['A5'] = 0;

  segraOrderMap['B1'] = 0;
  segraOrderMap['B2'] = 0;
  segraOrderMap['B3'] = 0;
  segraOrderMap['B4'] = 0;
  segraOrderMap['B5'] = 0;
  segraOrderMap['B6'] = 0;
  segraOrderMap['B7'] = 0;
  segraOrderMap['B8'] = 0;
  segraOrderMap['B9'] = 0;

  segraOrderMap['C1'] = 0;
  segraOrderMap['C2'] = 0;

  segraOrderMap['S1'] = 0;
  segraOrderMap['S2'] = 0;
  segraOrderMap['S3'] = 0;
  segraOrderMap['S4'] = 0;
  segraOrderMap['S5'] = 0;
  segraOrderMap['S6'] = 0;

  segraOrderMap['D1'] = 0;
  segraOrderMap['D2'] = 0;
  segraOrderMap['D3'] = 0;

  segraOrderMap['P'] = 0;

}