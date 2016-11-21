import 'globals.dart';
import 'dart:html';



void sendOrder(sheetData) {
    //Not sure, but I think we need this cookie first.
    String cookie = getCookie();
    Map<String, String> requestHeaders = headers;
    requestHeaders.putIfAbsent("Cookie", () {cookie;});

    //Sending the order is a 2-step process.
    //First, we have to send the actual order items.
    //Then, the server will redirect us to the page with the order details form
    //(name, address, phone, comments etc.)
    Map<String, String> orderFormData = prepareOrderFormData(sheetData);
    HttpRequest.postFormData(segraOrderUrl, orderFormData, requestHeaders: requestHeaders).then((response) {
        Map<String, String> orderDetailsData = prepareOrderDetailsData(sheetData);
        HttpRequest.postFormData(segraDetailsUrl, orderDetailsData, requestHeaders: requestHeaders);
    });
}

//See segra_post_order.txt for reference
Map<String, String> prepareOrderFormData(sheetData) {

    //Put sheet data here (replace the nulls):
    Map<String, String> comanda = {
        "a1_3": null,
        "a2_3": null,
        "a3_3": null,
        "a4_3": null,
        "a5_3": null,

        "b1_3": null,
        "b2_3": null,
        "b3_3": null,
        "b4_3": null,
        "b5_3": null,
        "b6_3": null,
        "b7_3": null,
        "b8_3": null,
        "b9_3": null,

        "c1_3": null,
        "c2_3": null,

        "s1_3": null,
        "s2_3": null,
        "s3_3": null,
        "s4_3": null,
        "s5_3": null,
        "s6_3": null,

        "d1_3": null,
        "d2_3": null,
        "d3_3": null,

        "p_3": null
    };

    Map<String, String> orderFormData = {
        "week_id": null, //???
        "start_date": null, //yyyy-mm-dd
        "end_date": null //yyyy-mm-dd
    };

    Map<String, String> prefixedComanda = prefixMap(comanda, "comanda");
    orderFormData.addAll(prefixedComanda);

    return orderFormData;
}

//See segra_post_details.txt for reference
Map<String, String> prepareOrderDetailsData(sheetData) {
    Map<String, String> clientInfo = {
        "name": null,
        "company": null,
        "phone": null,
        "email": null,
        "address": null,
        "deliv_time": "12:00",
        "obs": null,
    };

    Map<String, String> orderDetailsData = {
        "submitted": "1",
        "action": "review",
        "week_id": null, //???
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

Map<String, String> prefixMap(Map<String, String> map, String prefix) {
    Map<String, String> result;
    map.forEach((key, value) {
        result.putIfAbsent(prefix + "[" + key + "]", value);
    });

    return result;
}

final Map<String, String> headers = {
    "Host": "www.salanunta.ro",
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Accept-Encoding": "gzip, deflate",
    "Referer": "http://www.salanunta.ro/catering-zilnic.html",
    "Connection": "keep-alive",
    "Upgrade-Insecure-Requests": "1",
    "Pragma": "no-cache",
    "Cache-Control": "no-cache"
};