#! /bin/bash
dockerhosts="/etc/hosts"
dockerhostsbk="/etc/hostsbk"
if [ ! -f "$dockerhostsbk" ]; then
cp "$dockerhosts" "$dockerhostsbk"
fi
echo -e "本项目由：寒夜方舟（wnark.com）创建及维护.\n本项目执行(CC BY-NC 4.0).\n请选择加速还是恢复备份.\n（已自动备份）"
echo " 1: 加速"
echo " 2: 恢复"
read -p "请输入1|2。输入其他数字将会跳出脚本:"  idx
if (( '1' == "$idx" )); then
  cp "$dockerhostsbk" "$dockerhosts"
  echo "129.146.46.7 github-cloud.s3.amazonaws.com" >> "$dockerhosts"
  echo "129.146.46.7 github.com" >> "$dockerhosts"
  echo "129.146.46.7 registry.cnpmjs.org" >> "$dockerhosts"
  echo "129.146.46.7 registry.npmjs.com" >> "$dockerhosts"
  echo "129.146.46.7 r.cnpmjs.org" >> "$dockerhosts"
  echo "129.146.46.7 raw.githubusercontent.com" >> "$dockerhosts" 
elif (( '2' == "$idx" )); then
  cp "$dockerhostsbk" "$dockerhosts"
else
  echo "退出"
fi
echo -e "执行完成.\n由于个人能力有限无法收集所有的域名.\n欢迎补充。"