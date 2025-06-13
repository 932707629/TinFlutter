
import 'package:common_utils/common_utils.dart';

extension StringExtensions on String?{

  String orEmpty(){
    return this ?? '';
  }

}

extension IterableExtensions on Iterable?{

  int orEmpty(){
    return this?.length ?? 0;
  }

}

extension MapExtensions on Map?{

  int orEmpty(){
    return this?.length ?? 0;
  }

}

extension IntExtensions on int?{
  int orNull(){
    return this ?? 0;
  }

}

extension DoubleExtensions on double?{
  double orNull(){
    return this ?? 0.0;
  }
}

extension BoolExtensions on bool?{
  bool orNull(){
    return this ?? false;
  }
}

bool isEmpty(dynamic value){
  return ObjectUtil.isEmpty(value);
}

bool isNotEmpty(dynamic value){
  return ObjectUtil.isNotEmpty(value);
}

