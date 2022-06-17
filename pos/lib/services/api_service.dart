import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pos/models/api_models/response_model.dart';
import 'package:pos/services/app_service.dart';
import 'package:path/path.dart' as p;

class APIService {
  static const int _timeoutDuration = 20;

  static Future<GETResponse> get(String url) async {
    try {
      var apiUrl = Uri.parse(AppService.apiApp + url);
      final response = await http
          .get(apiUrl)
          .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
        return http.Response.bytes([], 408);
      });

      GETResponse resp = GETResponse(response.statusCode.toInt());
      if (resp.isSuccess) {
        resp.content = response.body.toString();
        return resp;
      } else {
        GETResponse _resp = GETResponse(600);
        return _resp;
      }
    } catch (_) {
      GETResponse _resp = GETResponse(600);
      return _resp;
    }
  }

  static Future<ODATAGETResponse> oDataGet(String url) async {
    try {
      var apiUrl = Uri.parse(AppService.apiApp + url);
      http.Response r = await http
          .get(apiUrl)
          .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
        return http.Response.bytes([], 408);
      });

      //Custom Response API
      ODATAGETResponse resp = ODATAGETResponse(r.statusCode);
      if (resp.isSuccess) {
        if (jsonDecode(r.body)["value"] == null) {
          resp = ODATAGETResponse(0);
        } else {
          resp.content = jsonEncode(jsonDecode(r.body)["value"]);
          if (jsonDecode(r.body)["@odata.count"] != null) {
            resp.count = jsonDecode(r.body)["@odata.count"];
          }
        }
      }
      return resp;
    } catch (_) {
      ODATAGETResponse _resp = ODATAGETResponse(600);
      return _resp;
    }
  }

  static Future<POSTResponse> post(String url, [String? model]) async {
    Map<String, String> data;
    data = <String, String>{'Content-Type': 'application/json'};

    var apiUrl = Uri.parse(AppService.apiApp + url);
    try {
      if (model?.isEmpty ?? true) {
        http.Response r = await http
            .post(apiUrl, headers: data)
            .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
          return http.Response.bytes([], 408);
        });
        //Custom Response API
        POSTResponse resp = POSTResponse(r.statusCode);
        if (resp.isSuccess) {
          resp.content = r.body.toString();
        }
        return resp;
      } else {
        http.Response r = await http
            .post(apiUrl, headers: data, body: model)
            .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
          return http.Response.bytes([], 408);
        });

        POSTResponse resp = POSTResponse(r.statusCode);
        if (resp.isSuccess) {
          resp.content = r.body.toString();
        }
        return resp;
      }
    } on SocketException {
      POSTResponse _resp = POSTResponse(600);
      return _resp;
    }
  }

  static Future<POSTResponse> uploadFile({
    required File file,
    String? fileName,
  }) async {
    var extension = p.extension(file.path);
    var name = fileName ?? p.basename(file.path);
    var uri = Uri.parse(AppService.apiApp + "upload");
    var request = http.MultipartRequest("POST", uri);
    List<int> bytes = await file.readAsBytes();

    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: name,
    );
    request.files.add(multipartFile);
    var response = await request.send();
    POSTResponse resp = POSTResponse(response.statusCode.toInt());
    resp.message = name;
    return resp;
  }
}
