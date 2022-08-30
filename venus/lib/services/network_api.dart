import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:venus/models/event.dart';
import 'package:venus/models/purchase.dart';
import 'package:venus/services/service_url.dart';
import 'package:venus/widgets/item_events.dart';

import '../utils/user_table.dart';

class NetworkAPI {
  final host = ServiceUrl.baseUrl;
  Map<String, String> commonHeaders = {
    'Content-Type': 'application/json',
    //'application/x-www-form-urlencoded; charset=UTF-8',
    'Accept': 'application/json'
  }; //common header properties for all http requests

  void httpGetRequest(
      String serviceUrl,
      Map<String, dynamic>? headers,
      void Function(bool serverError, Map<String, dynamic>? responseData)
          completionHandler) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    try {
      final response = await http.get(Uri.parse(this.host + serviceUrl),
          headers: httpHeaders);
      if (response.statusCode == 200) {
        final body = response.body;
        bool error = hasError(body);
        completionHandler(error, json.decode(body));
      } else {
        completionHandler(false, null);
      }
    } catch (e) {
      completionHandler(false, null);
      print(e.toString());
    }
  }

  void httpPostRequest(
      String serviceUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic> postData,
      void completionHandler(
          bool serverError, Map<String, dynamic>? responseData)) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    try {
      final response = await http.post(Uri.parse(this.host + serviceUrl),
          body: postData, headers: null);
      if (response.statusCode == 200) {
        final body = response.body;
        bool error = hasError(body);
        final resp = jsonDecode(body);
        print(resp);
        completionHandler(error, resp);
      } else {
        completionHandler(false, jsonDecode(response.body));
      }
    } catch (e) {
      print('Exception - $e');
      completionHandler(false, null);
    }
  }

  void httpSubmitPostReq(
      String serviceUrl,
      Map<String, dynamic>? headers,
      Map<String, dynamic> postData,
      void completionHandler(
          bool serverError, Map<String, dynamic>? responseData)) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    try {
      final response = await http.post(Uri.parse(this.host + serviceUrl),
          body: jsonEncode(postData),
           headers: httpHeaders
          , encoding: Encoding.getByName("utf-8")
      );
      print("paramsB " +jsonEncode(postData));

      String body = "";
      if (response.statusCode == 200) {
         body = response.body;
        print("body " + body);

        bool error = hasError(body);
        final resp = jsonDecode(body);
        print(resp);
        completionHandler(error, resp);
      } else {
        completionHandler(false, jsonDecode(response.body));

      }
    } catch (e) {
      print('Exception - $e');
      completionHandler(false, null);
    }
  }

  bool hasError(String body) {
    Map<String, dynamic> jsonBody = jsonDecode(body);
    bool error = jsonBody['status'];

    return error;
  }

  Future<String>? httpGetTerms(String serviceUrl, Map<String, String>? headers,
      Map<String, String>? params) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    final uri = Uri.parse(this.host + serviceUrl);

    try {
      final response = await http.get(uri, //Uri.parse(this.host + serviceUrl),
          headers: httpHeaders);
      if (response.statusCode == 200) {
        final body = response.body;
        bool error = hasError(body);
        if (!error) {
          final jsonResponse = json.decode(response.body);
          Map<String, dynamic> map = jsonResponse["data"];

          String terms = map!['terms_and_condition']!;

          return terms;
        }
      }
      throw Exception('Failed to load');
    } catch (e) {
      print('Exception - $e');
    }

    throw Exception('Failed to load');
  }


  Future<List<VenusEvent>>? httpGetEvents(
      String serviceUrl, Map<String, String>? headers) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    try {
      final response = await http.get(Uri.parse(this.host + serviceUrl),
          headers: httpHeaders);
      if (response.statusCode == 200) {
        final body = response.body;
        bool status = hasError(body);
        if (status) {
          final jsonResponse = json.decode(response.body);
          print("===============Events==============");
          print(jsonResponse["data"]);
          Map<String,dynamic> map = jsonResponse["data"];
          List<dynamic> list = map["member_events"];
          List<VenusEvent> eventList =
          (list).map((i) => VenusEvent.fromMap(i)).toList();
          return eventList;
        }
      }
      throw Exception('Failed to load');
    } catch (e) {
      print('Exception - $e');
    }

    throw Exception('Failed to load');
  }


  Future<List<Ticket>>? httpGetBookedTickets(
      String serviceUrl, Map<String, String>? headers) async {
    var httpHeaders = this.commonHeaders;
    if (headers != null) {
      httpHeaders.addAll(headers as Map<String, String>);
    }

    try {
      final response = await http.get(Uri.parse(this.host + serviceUrl),
          headers: httpHeaders);
      if (response.statusCode == 200) {
        final body = response.body;
        bool status = hasError(body);
        if (status) {
          final jsonResponse = json.decode(response.body);
          print("===============tickts==============");
          print(jsonResponse["data"]);
          List<dynamic> list = jsonResponse["data"];
          List<Ticket> eventList =
          (list).map((i) => Ticket.fromMap(i)).toList();
          return eventList;
        }
      }
      throw Exception('Failed to load');
    } catch (e) {
      print('Exception - $e');
    }

    throw Exception('Failed to load');
  }

}

