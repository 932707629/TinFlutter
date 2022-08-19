
import 'package:tin_flutter/generated/json/base/json_convert_content.dart';

class BaseResponseEntity<T> {

  T? data;
	int? errorCode;
	String? errorMsg;

	BaseResponseEntity.fromJson(dynamic result){
		if(result is Map){
			errorCode = result['code'];
			errorMsg = result['error'] != null ? result['error']:null ;
			data = JsonConvert.fromJsonAsT(result['data']);
		}
	}



}