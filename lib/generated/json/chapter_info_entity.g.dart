import 'package:tin_flutter/generated/json/base/json_convert_content.dart';
import 'package:tin_flutter/ui/bean/chapter_info_entity.dart';

ChapterInfoEntity $ChapterInfoEntityFromJson(Map<String, dynamic> json) {
	final ChapterInfoEntity chapterInfoEntity = ChapterInfoEntity();
	final List<String>? children = jsonConvert.convertListNotNull<String>(json['children']);
	if (children != null) {
		chapterInfoEntity.children = children;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		chapterInfoEntity.courseId = courseId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		chapterInfoEntity.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		chapterInfoEntity.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		chapterInfoEntity.parentChapterId = parentChapterId;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		chapterInfoEntity.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		chapterInfoEntity.visible = visible;
	}
	return chapterInfoEntity;
}

Map<String, dynamic> $ChapterInfoEntityToJson(ChapterInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['children'] =  entity.children;
	data['courseId'] = entity.courseId;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}