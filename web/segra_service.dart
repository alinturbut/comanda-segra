import 'constants.dart';
import 'dart:html';
import 'segra_logic.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'segra_config.dart' as config;

Future sendOrder() {
    Completer completer = new Completer();
    config.checkIfOrderIsReady().then((response) {
       if(response == "true") {
           //Not sure, but I think we need this cookie first.
           String cookie = getCookie();
           Map<String, String> requestHeaders = headers;
           requestHeaders["Cookie"] = cookie;

           //Sending the order is a 2-step process.
           //First, we have to send the actual order items.
           //Then, the server will redirect us to the page with the order details form
           //(name, address, phone, comments etc.)
           extractNeededInformation().then((sheetData) {
               Map<String, String> orderFormData = prepareOrderFormData(sheetData);
//               HttpRequest.postFormData(segraOrderUrl, orderFormData, requestHeaders: requestHeaders).then((response) {
//                   Map<String, String> orderDetailsData = prepareOrderDetailsData(sheetData);
//                   HttpRequest.postFormData(segraDetailsUrl, orderDetailsData, requestHeaders: requestHeaders);
//               });

               return completer.complete(sheetData);
           });
       } else {
           return completer.complete("Order is already sent.");
       }
    });

    return completer.future;
}

//See segra_post_order.txt for reference
Map<String, String> prepareOrderFormData(Map<String, dynamic> sheetData) {

    Map<String, String> comanda = new Map();
    sheetData.forEach((key, value) {
        comanda.putIfAbsent(key.toLowerCase() + "_3", () => value.toString());
    });

    DateTime today = new DateTime.now();
    DateFormat format = new DateFormat("yyyy-MM-dd");
    Map<String, String> orderFormData = {
        "week_id": getWeekId(), //???
        "start_date": format.format(today.subtract(new Duration(days: today.weekday - DateTime.MONDAY))), //yyyy-mm-dd
        "end_date": format.format(today.add(new Duration(days: DateTime.FRIDAY - today.weekday))) //yyyy-mm-dd
    };

    Map<String, String> prefixedComanda = prefixMap(comanda, "comanda");
    orderFormData.addAll(prefixedComanda);

    return orderFormData;
}

//See segra_post_details.txt for reference
Map<String, String> prepareOrderDetailsData(sheetData) {
    Map<String, String> clientInfo = {
        "name": "Cristian Popa",
        "company": "VOQUZ",
        "phone": "0725515970",
        "email": null,
        "address": "Str. Garii nr. 21",
        "deliv_time": "12:00",
        "obs": null,
    };

    Map<String, String> orderDetailsData = {
        "submitted": "1",
        "action": "review",
        "week_id": getWeekId(),
        "btn_submit": "Trimite"
    };

    Map<String, String> prefixedClientInfo = prefixMap(clientInfo, "client_info");
    orderDetailsData.addAll(prefixedClientInfo);

    return orderDetailsData;
}

String getCookie() {
    String cookie;
    HttpRequest.request(segraUrl).then((response) {
        cookie = response.getResponseHeader("Set-Cookie")
          .split(";")
          .firstWhere((str) { return str.contains("segra");});
    });

    return cookie;
}

String getWeekId() {
    DateTime now = new DateTime.now();
    return (now.day / 7 + 1).toString();
}

Map<String, String> prefixMap(Map<String, String> map, String prefix) {
    Map<String, String> result = new Map();
    map.forEach((key, value) {
        result.putIfAbsent(prefix + "[" + key + "]", () => value);
    });

    return result;
}