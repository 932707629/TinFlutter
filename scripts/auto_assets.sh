#!/bin/bash
###
#==========该脚本只会遍历assets/images/下面的资源===============
#1: 将终端cd 到当前(scripts)路径，然后执行 3 步骤
#2: chmod +x auto_assets.sh  如果 3 步骤报错，先执行这个
#3: ./auto_assets.sh [命名风格] [是否添加后缀]
#    默认命名风格是 underscore，后缀添加是 false

set -e

# 定义相对路径
ASSETS_DIR="../assets/images"

# 从 scripts 目录到 config 目录的相对路径
CONFIG_DIR="../lib/generated"

# 获取命令行传入的参数，默认命名风格为 "underscore" 和默认不添加后缀
USE_UNDERSCORE="${1:-underscore}"
# 是否不执行 flutter pub get, 默认为执行(fast_auto_assets.sh)
FAST_MODE=$2

# 配置文件路径
CONFIG_FILE="$CONFIG_DIR/app_image_path.dart"

# 创建配置目录
mkdir -p "$CONFIG_DIR"

# 创建配置文件
echo "// 自动生成的资源配置文件" > "$CONFIG_FILE"
echo "// ignore_for_file: constant_identifier_names" >> "$CONFIG_FILE"

echo "abstract class AppImagePath {" >> "$CONFIG_FILE"

# 处理资产图像的函数
function process_images {
    local dir="$1"
    local add_suffix="$2"  # 是否增加后缀

    echo ">>>>>>>>>>>>>>>>>开始处理目录: $dir>>>>>>>>>>>>>>>>>>>"

    # 遍历指定目录下的所有图像文件
    find "$dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.ico" -o -name "*.webp" -o -name "*.heif" -o -name "*.svg" -o -name "*.gif" \) -print0 | sort -z | while IFS= read -r -d '' file; do
        # 计算相对路径
        relative_path="${file#${dir}/}"
        file_name_without_ext="${relative_path%.*}"

        # 生成常量名称
        constant_name="${file_name_without_ext//\//_}"  # 替换路径中的 / 为 _

        # 根据命名风格修改常量格式
        if [[ $USE_UNDERSCORE == "camelcase" ]]; then
            # 将下划线分隔的字符串转换为小驼峰命名
            constant_name=$(echo "$constant_name" | sed -r 's/(^|_)([a-z])/\U\2/g' | sed 's/^_//')
        fi

        # 如果需要添加后缀
        if [ "$add_suffix" == "true" ]; then
            if [[ $USE_UNDERSCORE == "underscore" ]]; then
                constant_name="${constant_name}_suffix"
            else
                constant_name="${constant_name}Suffix"
            fi
        fi

        # 写入常量定义到配置文件
        echo " static const String $constant_name = 'assets/images/$relative_path';" >> "$CONFIG_FILE"
    done
}

# 处理 assets/images 目录
process_images "$ASSETS_DIR"

echo "<<<<<<<<<<<<<<<<<<<文件生成结束<<<<<<<<<<<<<<<<<<<"
echo "}" >> "$CONFIG_FILE"


if [ "$FAST_MODE" != "fast" ]; then

  # 返回上一级目录 如果不返回上级目录 执行 flutter pub get 会在 scripts 里面生成build/.last_build_id 文件
  cd ..
  # 最后再次执行 flutter pub get
  flutter pub get
fi

echo "配置文件生成完成: $CONFIG_FILE"
