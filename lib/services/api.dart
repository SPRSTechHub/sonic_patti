import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/models/games_model.dart';
import '../models/catagory_model.dart';

class RemoteApi {
  static var client = http.Client();
//  static var url = 'https://control.fatafatguru.in/api';
  static var url = 'https://console.digitalsprs.fun/api';

  static Future<List<Catlists>?> fetchCatagory(
      String action, String day) async {
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
    };
    var postData = {'action': action, 'day': day};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['message']['results']);
        return catlistsFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<GameLists>?> fetchGameLists(
      String action, String day, String catId) async {
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
    };
    var postData = {'action': action, 'day': day, 'cat_id': catId};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['result']);
        return gameListsFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  // Bid list api call
  static Future<List<BidsList>?> fetchBidLists(
      String action,
      String mobile,
      String? catId,
      String sortBy,
      String sortTo,
      String lstart,
      String lend,
      String? searchKey) async {
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
    };
    var postData = {
      'action': action,
      'mobile': mobile,
      'sortBy': sortBy,
      'sortTo': sortTo,
      'lstart': lstart,
      'lend': lend,
      //'searchKey': searchKey,
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);

        return bidsListFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  // Sign In api call
  static Future<dynamic>? signInCall(
      String action,
      String? mobile,
      String? password,
      String? fullname,
      String? referid,
      String? token) async {
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
    };

    var postData = {
      'action': action,
      'mobile': mobile,
      //'searchKey': searchKey,
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      print(resp);
      /* if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);
        print(jsonString);
        return jsonString;
      } else {
        return null;
      } */
    } else {
      return null;
    }
  }

// Sign In api call
  static Future<dynamic>? signUpCall(
      String action,
      String? mobile,
      String? password,
      String? fullname,
      String? referid,
      String? token) async {
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
    };

    var postData = {
      'action': action,
      'mobile': mobile,
      'password': password,
      'fullname': fullname,
      'refer_id': referid,
      'devkey': token
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return resp;
    } else {
      return null;
    }
  }
}
