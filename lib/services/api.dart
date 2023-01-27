import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/models/games_model.dart';
import 'package:sonic_patti/models/pg_model.dart';
import '../models/catagory_model.dart';

class RemoteApi {
  static var client = http.Client();
//  static var url = 'https://control.fatafatguru.in/api';
  static var url = 'https://console.digitalsprs.fun/api';

  static Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };

  static Future<List<Catlists>?> fetchCatagory(
      String action, String day) async {
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
      String catId,
      String? sortBy,
      String? sortTo,
      String? lstart,
      String? lend,
      String? searchKey) async {
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

//Minimum Deposite Check
  static Future<dynamic>? findWhat(String action, String? param) async {
    var postData = {'action': action, 'params': param};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return resp;
    } else {
      return null;
    }
  }

//Make Payment Order
/* Upi India */
  static Future<dynamic>? createPymntOrder(
      String action, mobile, amount, trtype, pmgateway, token) async {
    var postData = {
      'action': action,
      'mobile': mobile,
      'amount': amount,
      'trtype': trtype,
      'pmgateway': pmgateway,
      'deviceKey': token
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

  static Future<dynamic>? chkPymntOrder(String action, mobile, ordId, amnt,
      txnId, resCode, txnRef, approvalRef) async {
    var postData = {
      'action': action,
      'mobile': mobile,
      'ordId': ordId,
      'amount': amnt,
      'txnId': txnId,
      'resCode': resCode,
      'txnRef': txnRef,
      'approvalRef': approvalRef
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

// Sign Up api call
  static Future<dynamic>? signUpCall(
      String action,
      String? mobile,
      String? password,
      String? fullname,
      String? referid,
      String? token) async {
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

  // Sign In api call
  static Future<dynamic>? signInCall(
      String action, String? mobile, String? password, String? token) async {
    var postData = {
      'action': action,
      'mobile': mobile,
      'password': password,
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

// Fetch User Details
  static Future<dynamic>? getUser(String? action, String? mobile) async {
    var postData = {'action': action, 'mobile': mobile};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return resp;
    } else {
      return null;
    }
  }

  // Bids Submissions

  static Future<dynamic> bidSubmission(String? bidsData) async {
    var jsonBody = {
      'action': 'betplace',
      'bidlists': bidsData,
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] != '') {
        return resp;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to submit data.');
    }
  }

  static Future<List<PgmClass>?> fetchPmtg(String action) async {
    var postData = {'action': action};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['message']);
        return pgmClassFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
