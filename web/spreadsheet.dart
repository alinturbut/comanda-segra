import "package:http/browser_client.dart" as http;
import 'dart:async';

var spreadsheetUrl = "https://docs.google.com/spreadsheets/d/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM";
var spreadsheetKey = "1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM";
var sheetsApiV4SegraUrl = "https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/O6:O16";
var googleApiKey = "AIzaSyDW3drVU6WDx-kbkzPEU_oQFUE1ztL4CnI";

Future getRangeExample() {
  var url = sheetsApiV4SegraUrl + "?key=" + googleApiKey;
  var client=new http.BrowserClient();

  return client.get(url).then((response) => print(response.body));
}

Future getSegraOrderItemsForToday(){
  DateTime today=new DateTime.now();
  //weekday: 1 = MONDAY, 7 = SUNDAY
  var weekday=today.weekday;
  var sheetsApiSegraUrl="";

  switch(weekday) {
    case 1:
      sheetsApiSegraUrl="https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/B23:B48";
      break;
    case 2:
      sheetsApiSegraUrl="https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/C23:C48";
      break;
    case 3:
      sheetsApiSegraUrl="https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/D23:D48";
      break;
    case 4:
      sheetsApiSegraUrl="https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/E23:E48";
      break;
    case 5:
      sheetsApiSegraUrl="https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/F23:F48";
      break;
    default:
      sheetsApiSegraUrl="";
  }

  if(sheetsApiSegraUrl.length>0) {
    var url = sheetsApiSegraUrl + "?key=" + googleApiKey;
    var client = new http.BrowserClient();

    return client.get(url).then((response) => print(response.body));
  }
}
