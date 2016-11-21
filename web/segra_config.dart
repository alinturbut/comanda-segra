import 'dart:convert';
import 'dart:async';
import 'dart:html';

Future checkIfOrderIsReady() async {

  var path="http://localhost:8080/orderready.txt";
  var ready=false;

  HttpRequest.getString(path).then((myjson){
    Map data=JSON.decode(myjson);
    ready=data["ready"];
    print(ready);
  });

  return ready;

}
