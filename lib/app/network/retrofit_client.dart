
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/ui/bean/base_response_entity.dart';
import 'package:tin_flutter/ui/bean/chapter_info_entity.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: Global.base_url,parser: Parser.JsonSerializable)
abstract class RetrofitClient{

  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;


  @GET('/wxarticle/chapters/json')
  Future<BaseResponseEntity<List<ChapterInfoEntity>>> getChapters();

  @POST('/article/query/0/json')
  Future<BaseResponseEntity<String>> queryArticle(@Body() Map<String,dynamic> params,);















}





















