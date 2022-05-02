class GETResponse {
  int? statusCode;
  bool isSuccess = false;
  String content = "";
  String message = "";
  GETResponse(int _statusCode) {
    statusCode = _statusCode;
    isSuccess = GETAPIMessage(_statusCode).isSuccess;
    message = GETAPIMessage(_statusCode).message;
  }
}

//Odata Get Response
class ODATAGETResponse {
  int? statusCode;
  int count = 0;
  bool isSuccess = false;
  String content = "";
  String message = "";
  ODATAGETResponse(int _statusCode) {
    statusCode = _statusCode;
    isSuccess = GETAPIMessage(_statusCode).isSuccess;
    message = GETAPIMessage(_statusCode).message;
  }
}

class POSTResponse {
  int? statusCode;
  bool isSuccess = false;
  String content = "";
  String message = "";
  POSTResponse(int _statusCode) {
    statusCode = _statusCode;
    isSuccess = GETAPIMessage(_statusCode).isSuccess;
    message = GETAPIMessage(_statusCode).message;
  }
}

class GETAPIMessage {
  String message = "";
  bool isSuccess = false;
  GETAPIMessage(int _code) {
    switch (_code) {
      case 200:
        isSuccess = true;
        message = "success";
        break;
      case 201:
        isSuccess = true;
        message = "created";
        break;
      case 204:
        isSuccess = true;
        message = "no_content";
        break;
      case 400:
        isSuccess = false;
        message = "bad_request";
        break;
      case 401:
        isSuccess = false;
        message = "unauthorized";
        break;
      case 403:
        isSuccess = false;
        message = "forbidden";
        break;
      case 404:
        isSuccess = false;
        message = "not_found";
        break;
      case 409:
        isSuccess = false;
        message = "conflict";
        break;
      case 408:
        isSuccess = false;
        message = "connection_timeout";
        break;
      case 500:
        isSuccess = false;
        message = "internal_server_error";
        break;

      case 600:
        isSuccess = false;
        message = "you_are_no_internet_connection";
        break;
      default:
        isSuccess = false;
        message = "error";
        break;
    }
  }
}
