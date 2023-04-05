import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sonicpattilive/models/bids_modal.dart';
import 'package:sonicpattilive/models/games_model.dart';
import 'package:sonicpattilive/models/market_ratio.dart';
import 'package:sonicpattilive/models/pg_model.dart';
import 'package:sonicpattilive/models/transactions.dart';
import 'package:sonicpattilive/models/win_model.dart';
import 'package:sonicpattilive/utils/constants.dart';
import '../models/catagory_model.dart';
import '../models/game_offers_model.dart';

class RemoteApi {
  static var client = http.Client();
  static var url = Constant.box.read('apiUrl') + '/api/';

  static Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };

  static Future<List<Catlists>?> fetchCatagory(
      String action, String day) async {
    var postData = {'action': action, 'day': day};
    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);
    //print(response.body);
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

// Winnings //
  static Future<List<WinModal>?> fetchWinining(
      String action,
      String mobile,
      String catId,
      String? sortBy,
      String? sortTo,
      String? lstart,
      String? lend) async {
    var postData = {
      'action': action,
      'mobile': mobile,
      'catId': catId,
      'sortBy': sortBy,
      'sortTo': sortTo,
      'lstart': lstart,
      'lend': lend,
      'searchKey': ''
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);

        return winModalFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

// Transactions //
  static Future<List<TransactionsClass>?> fetchTransactionDetails(
      String action,
      String mobile,
      String? sortBy,
      String? sortTo,
      String? lstart,
      String? lend) async {
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

        return transactionsClassFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  // Offline Deposites
  static Future<List<OflDepoModel>?> fetchOFLDTransactionDetails(
      String action, String mobile) async {
    var postData = {
      'action': action,
      'mobile': mobile,
    };
    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);
        return oflDepoModelFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

//Get Game Offers
  static Future<GameOfferModel?> fetchOffers(
      String action, String? catId) async {
    var postData = {'action': action, 'cat_id': catId};
    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return GameOfferModel.fromJson(resp);
    } else {
      return null;
    }
  }

//Minimum Deposite Check
  static Future<MktClass?> fetchMarket(String action, String? catId) async {
    var postData = {'action': action, 'cat_id': catId};
    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return resp['status'] == 0 ? MktClass.fromJson(resp['data']) : null;
    } else {
      return null;
    }
  }

// Makae Offline Payment
  static Future<dynamic>? makePaymentOffline(
      String action, String? mobile, date, trno, amount, image, token) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['action'] = action;
    request.fields['mobile'] = mobile!;
    request.fields['amount'] = amount;
    request.fields['trno'] = trno;
    request.fields['deviceKey'] = token;
    var pic = await http.MultipartFile.fromPath("image", image);
    request.files.add(pic);
    var response = await request.send();
    final result = await http.Response.fromStream(response);
    if (result.statusCode == 200) {
      var resp = jsonDecode(result.body);
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
  static Future<dynamic>? getUser(
      String? action, String? mobile, String? token) async {
    var postData = {'action': action, 'mobile': mobile, 'deviceKey': token};
    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      //print(resp);
      return resp;
    } else {
      return null;
    }
  }

// Fetch AppLink
  static Future<dynamic>? getAppLink(String? action, String? token) async {
    var postData = {'action': action, 'deviceKey': token};
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

  static Future<PgmClass?> fetchPmtg(String action) async {
    var postData = {'action': action};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var resp = json.decode(response.body);
        return PgmClass.fromJson(resp['data']);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
