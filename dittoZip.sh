#!/usr/bin/env bash

#脚本用于构建模拟器应用的.zip压缩包，请将本可执行exec脚本和需要构建压缩的.app包放于同一绝对路径下
#由外部输入不带有.app后缀的包名
read -p "输入.app包名[不带.app后缀]:" app_name
#取当前的绝对路径
work_path=$(dirname $0)
#输出当前的绝对路径
echo $work_path
#移动到当前的绝对路径下
cd $work_path
if [ -d $app_name.app ]; then

#先删除zip文件夹，再在ditto指令下压缩并将压缩的zip移动到/zip的文件夹下
rm -rf zip
#将.app包压缩成.zip的压缩文件
ditto -ck --sequesterRsrc --keepParent `ls -1 -d -t $work_path/$app_name.app | head -n 1` zip/$app_name.zip

# unzip zip/$app_name.zip -d zip
# cd $work_path/zip
# xcrun simctl install booted $work_path/zip/$app_name.app

echo "completed !"
exit 0
else
echo "$app_name->文件不存在"
exit 0
fi
