import 'constants.dart';
import 'dart:html';
import 'segra_logic.dart';

void sendOrder() {
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
        HttpRequest.postFormData(segraOrderUrl, orderFormData, requestHeaders: requestHeaders).then((response) {
            Map<String, String> orderDetailsData = prepareOrderDetailsData(sheetData);
            HttpRequest.postFormData(segraDetailsUrl, orderDetailsData, requestHeaders: requestHeaders);
        });
    });

}

//See segra_post_order.txt for reference
Map<String, String> prepareOrderFormData(Map<String, dynamic> sheetData) {

    //Put sheet data here (replace the nulls):
    Map<String, String> comanda = {
        "a1_3": sheetData["A1"],
        "a2_3": sheetData["A2"],
        "a3_3": sheetData["A3"],
        "a4_3": sheetData["A4"],
        "a5_3": sheetData["A5"],

        "b1_3": sheetData["B1"],
        "b2_3": sheetData["B2"],
        "b3_3": sheetData["B3"],
        "b4_3": sheetData["B4"],
        "b5_3": sheetData["B5"],
        "b6_3": sheetData["B6"],
        "b7_3": sheetData["B7"],
        "b8_3": sheetData["B8"],
        "b9_3": sheetData["B9"],

        "c1_3": sheetData["C1"],
        "c2_3": sheetData["C2"],

        "s1_3": sheetData["S1"],
        "s2_3": sheetData["S2"],
        "s3_3": sheetData["S3"],
        "s4_3": sheetData["S4"],
        "s5_3": sheetData["S5"],
        "s6_3": sheetData["S6"],

        "d1_3": sheetData["D1"],
        "d2_3": sheetData["D2"],
        "d3_3": sheetData["D3"],

        "p_3": sheetData["P"]
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