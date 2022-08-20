
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:tin_flutter/app/logger.dart';
import 'package:rxdart/rxdart.dart' as Rx;

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
    // httpClient.addRequestModifier((Request request){
    //   var requestLog = 'REQUEST#################\n'+
    //       'HEADERS=${request.headers}\n'+
    //       'URL=${request.url}\n'+
    //       'METHOD=${request.method}\n'+
    //       'CONTENT_LENGTH=${request.contentLength}';
    //   return request;
    // });
    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    httpClient.addResponseModifier((request, response) {
      loggerArray([response.statusCode,request.url.toString(),response.bodyString], name: "RESPONSE" );
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


  Stream<Response<T>> getStream<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) {
    Future<Response<T>> future = get(url, headers:headers, contentType:contentType, query:query, decoder:decoder);
    return future.asStream();
  }


  @override
  Future<Response<T>> get<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) {
    loggerArray(['GET请求参数',url,headers,contentType,query]);
    return super.get(url, headers:headers, contentType:contentType, query:query, decoder:decoder);
  }


  @override
  Future<Response<T>> post<T>(String? url, body, {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query, Decoder<T>? decoder, Progress? uploadProgress}) {
    final bodyData = (body != null && body is FormData) ? body.fields.map((e) => '${e.key}:${e.value}').toList() : body;
    loggerArray(['POST请求参数',url,bodyData,contentType,headers,query]);
    return super.post(url, body, contentType: contentType, headers:headers, query:query, decoder:decoder, uploadProgress:uploadProgress);
  }







}