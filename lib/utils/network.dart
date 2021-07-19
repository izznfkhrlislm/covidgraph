import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkModel {
  var response;
  int? statusCode;
  String? errorMessage;

  NetworkModel({
    this.response,
    this.statusCode,
    this.errorMessage
  });
}

class NetworkException implements Exception {
  String? _message;
  int? _statusCode;
  var _response;

  NetworkException({String? message, int? statusCode, var response}) {
    this._message = message;
    this._response = response;
    this._statusCode = statusCode;
  }

  @override
  String toString() {
    return "Status code: ${this._statusCode}, Message: ${this._message}";
  }

  String? get message => this._message;
  int? get statusCode => this._statusCode;
  get response => this._response;
}

class NetworkInterface {
  String url = "";
  String? key = "";
  static const Map<String, String> REQUEST_HEADERS = {
    "Content-Type": "application/json"
  };

  Future<NetworkModel> post({
    required String path,
    required dynamic bodyParams,
  }) async {
    try {
      NetworkModel model;
      model = await http.post(
        Uri.https(url, "/api/v1/$path"),
        headers: REQUEST_HEADERS,
      ).then((response) async {
        if (response.statusCode >= 400) {
          throw new NetworkException(
            message: response.body,
            statusCode: response.statusCode,
            response: json.decode(response.body));
        } else {
          dynamic responseBody = json.decode(response.body);
          return NetworkModel(
            statusCode: response.statusCode,
            response: responseBody
          );
        }
      });

      return model;
    } on Exception catch (e) {
      throw new NetworkException(
        message: e.toString(),
        statusCode: HttpStatus.internalServerError,
        response: {
          "message": e.toString(),
        }
      );
    }
  }

  Future<NetworkModel> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      NetworkModel model;
      model = await http.get(
        Uri.https(url, "/api/v1/$path", queryParams),
        headers: REQUEST_HEADERS,
      ).then((response) async {
        if (response.statusCode >= 400) {
          throw new NetworkException(
              message: response.body,
              statusCode: response.statusCode,
              response: json.decode(response.body));
        } else {
          dynamic responseBody = json.decode(response.body);
          return NetworkModel(
              statusCode: response.statusCode,
              response: responseBody
          );
        }
      });

      return model;
    } on Exception catch (e) {
      throw new NetworkException(
        message: e.toString(),
        statusCode: HttpStatus.internalServerError,
        response: {
          "message": e.toString()
        }
      );
    }
  }
}