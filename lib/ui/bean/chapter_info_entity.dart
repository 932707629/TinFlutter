import 'dart:convert';

import 'package:tin_flutter/generated/json/base/json_field.dart';
import 'package:tin_flutter/generated/json/chapter_info_entity.g.dart';

@JsonSerializable()
class ChapterInfoEntity {

	List<String>? children;
	int? courseId;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
  
  ChapterInfoEntity();

  factory ChapterInfoEntity.fromJson(Map<String, dynamic> json) => $ChapterInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChapterInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}