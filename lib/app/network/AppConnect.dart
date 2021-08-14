
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../index.dart';

class AppConnect extends GetConnect{

  @override
  void onInit() {
    super.onInit();
    // All request will pass to jsonEncode so CasesModel.fromJson()
    // httpClient.defaultDecoder
    httpClient.baseUrl = 'https://www.wanandroid.com';
    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = Duration(seconds: 60);
    // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
    // Http and websockets if used with no [httpClient] instance
    // It's will attach 'apikey' property on header from all requests
    httpClient.addRequestModifier((Request request){
      var requestLog = 'REQUEST#################\n'+
          'HEADERS=${request.headers}\n'+
          'URL=${request.url}\n'+
          'METHOD=${request.method}\n'+
          'CONTENT_LENGTH=${request.contentLength}';
      logger.i('Request',requestLog);
      return request;
    });
    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    httpClient.addResponseModifier((request, response) {
      var responseLog = 'RESPONSE#################\n'+
          'STATUS=${response.statusCode}\n'+
          'URL=${request.url}\n'+
          'BODY=${response.bodyString}';
      logger.i('Response',responseLog);
      return response;
    });

    /*httpClient.addAuthenticator((Request request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });*/

  }

  AppConnect._internal();

  static AppConnect? instance;

  static getInstance() {
    if (instance == null) {
      instance = AppConnect._internal();
      instance?.onInit();
    }
    return instance;
  }

  factory AppConnect() => getInstance();







}