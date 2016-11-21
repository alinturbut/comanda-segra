import "package:http/browser_client.dart" as http;
import 'dart:async';

var spreadsheetUrl = 'https://docs.google.com/spreadsheets/d/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM';
var spreadsheetKey = '1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM';
var sheetsApiV4SegraUrl = 'https://sheets.googleapis.com/v4/spreadsheets/1BnAnqvd5EuL84QrUCgNEXbqupVgu-PkZPcZNYMVkwfM/values';
var rangeExample = 'O6:O16';
var googleApiKey = 'AIzaSyDW3drVU6WDx-kbkzPEU_oQFUE1ztL4CnI';

Future getRangeExample() {
  var url = sheetsApiV4SegraUrl + '/' + rangeExample + "?key=" + googleApiKey;
  var client=new http.BrowserClient();

  return client.get(url).then((response) => print(response.body));
}

Future getSegraInfoFromRange(range) {
  var url = sheetsApiV4SegraUrl + '/' + range + '?key=' + googleApiKey;
  var client=new http.BrowserClient();

  return client.get(url).then((response) => response);
}

Future getSegraComments() {
  var url = sheetsApiV4SegraUrl + ':batchGet' + '?ranges=L23:L34&ranges=U23:U34' + "&key=" + googleApiKey;
  http.BrowserClient client = new http.BrowserClient();

  return client.get(url).then((response) => response);
}
