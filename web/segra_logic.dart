import 'dart:core';
import 'spreadsheet.dart' as spreadsheet;
import 'dart:convert';
import 'dart:async';

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

Future extractNeededInformation() {
  var results = '';
  Map segraOrder = createSegraOrderMap();
  return spreadsheet.getSegraInfoFromRange(getCurrentDayRange()).then((response) {
    results = JSON.decode(response.body);

    if(results != '') {
      print('A1: ' + results['values'][0][0]);
      segraOrder['A1'] = results['values'][0][0];

      print('A2: ' + results['values'][1][0]);
      segraOrder['A2'] = results['values'][1][0];

      print('A3: ' + results['values'][2][0]);
      segraOrder['A3'] = results['values'][2][0];

      print('A4: ' + results['values'][3][0]);
      segraOrder['A4'] = results['values'][3][0];

      print('A5: ' + results['values'][4][0]);
      segraOrder['A5'] = results['values'][4][0];


      print('B1: ' + results['values'][5][0]);
      segraOrder['B1'] = results['values'][5][0];

      print('B2: ' + results['values'][6][0]);
      segraOrder['B2'] = results['values'][6][0];

      print('B3: ' + results['values'][7][0]);
      segraOrder['B3'] = results['values'][7][0];

      print('B4: ' + results['values'][8][0]);
      segraOrder['B4'] = results['values'][8][0];

      print('B5: ' + results['values'][9][0]);
      segraOrder['B5'] = results['values'][9][0];

      print('B6: ' + results['values'][10][0]);
      segraOrder['B6'] = results['values'][10][0];

      print('B7: ' + results['values'][11][0]);
      segraOrder['B7'] = results['values'][11][0];

      print('B8: ' + results['values'][12][0]);
      segraOrder['B8'] = results['values'][12][0];

      print('B9: ' + results['values'][13][0]);
      segraOrder['B9'] = results['values'][13][0];


      print('C1: ' + results['values'][14][0]);
      segraOrder['C1'] = results['values'][14][0];

      print('C2: ' + results['values'][15][0]);
      segraOrder['C2'] = results['values'][15][0];


      print('S1: ' + results['values'][16][0]);
      segraOrder['S1'] = results['values'][16][0];

      print('S2: ' + results['values'][17][0]);
      segraOrder['S2'] = results['values'][17][0];

      print('S3: ' + results['values'][18][0]);
      segraOrder['S3'] = results['values'][18][0];

      print('S4: ' + results['values'][19][0]);
      segraOrder['S4'] = results['values'][19][0];

      print('S5: ' + results['values'][20][0]);
      segraOrder['S5'] = results['values'][20][0];

      print('S6: ' + results['values'][21][0]);
      segraOrder['S6'] = results['values'][21][0];


      print('P: ' + results['values'][22][0]);
      segraOrder['P'] = results['values'][22][0];

      return segraOrder;
    }
  });
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

  return segraOrderMap;
}