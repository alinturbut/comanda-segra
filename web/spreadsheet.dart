import "package:http/browser_client.dart" as http;
import 'dart:async';

var spreadsheetUrl = 'https://docs.google.com/spreadsheets/d/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM';
var spreadsheetKey = '1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM';
var sheetsApiV4SegraUrl = 'https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values/';
var rangeExample = 'O6:O16';
var googleApiKey = 'AIzaSyDW3drVU6WDx-kbkzPEU_oQFUE1ztL4CnI';

Future getRangeExample() {
  var url = sheetsApiV4SegraUrl + "?key=" + googleApiKey;
  var client=new http.BrowserClient();

  return client.get(url).then((response) => print(response.body));
}

Future getSegraInfoFromRange(range) {
  var url = sheetsApiV4SegraUrl + range + '?key=' + googleApiKey;
  var client=new http.BrowserClient();

  return client.get(url).then((response) => response);
}
