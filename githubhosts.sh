#!/bin/bash
dockerhosts="/etc/hosts"
dockerhostsbk="/etc/hostsbk"
if [ ! -d "$dockerhostsbk"]; then
cp "$dockerhosts" "$dockerhostsbk"
fi
echo -e "请选择加速还是恢复备份.\n（已自动备份）"
echo " 1: 加速"
echo " 2: 恢复"
read -p "请输入1|2。输入其他数字将会跳出脚本:"  idx
if [[ '1' = "$idx" ]];then
  mv "$dockerhostsbk" "$dockerhosts"
  echo "129.146.46.7 github-cloud.s3.amazonaws.com" >> "$dockerhosts"
  echo "129.146.46.7 github.com" >> "$dockerhosts"
  echo "129.146.46.7 registry.cnpmjs.org" >> "$dockerhosts"
  echo "129.146.46.7 registry.npmjs.com" >> "$dockerhosts"
  echo "129.146.46.7 r.cnpmjs.org" >> "$dockerhosts"
elif [[ '2' = "$idx" ]];then
  mv "$dockerhostsbk" "$dockerhosts"
else
  echo "退出"
fi
echo -e "执行完成.\n由于个人能力有限无法收集所有的域名.\n欢迎补充。"
