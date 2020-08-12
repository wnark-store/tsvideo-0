#! /bin/bash
dockerhosts="/etc/hosts"
dockerhostsbk="/etc/hostsbk"
if [ ! -f "$dockerhostsbk" ]; then
cp "$dockerhosts" "$dockerhostsbk"
fi
echo -e "本项目由：寒夜方舟（wnark.com）创建及维护.\n请选择加速还是恢复备份（已自动备份）"
OPTIONS="加速 恢复 退出"
select opt in $OPTIONS;do
if [ "$opt" = "加速" ];then
  cp "$dockerhostsbk" "$dockerhosts"
  echo "129.146.46.7 github-cloud.s3.amazonaws.com" >> "$dockerhosts"
  echo "129.146.46.7 github.com" >> "$dockerhosts"
  echo "129.146.46.7 raw.githubusercontent.com" >> "$dockerhosts" 
  echo "129.146.46.7 github.global.ssl.fastly.net " >> "$dockerhosts" 
  echo "129.146.46.7 assets-cdn.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 documentcloud.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 gist.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 help.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 nodeload.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 raw.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 status.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 training.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 www.github.com" >> "$dockerhosts" 
  echo "129.146.46.7 avatars0.githubusercontent.com" >> "$dockerhosts"
  echo "129.146.46.7 avatars1.githubusercontent.com" >> "$dockerhosts" 
  echo "129.146.46.7 codeload.github.com" >> "$dockerhosts" 
  
  echo "129.146.46.7 registry.cnpmjs.org" >> "$dockerhosts"
  echo "129.146.46.7 registry.npmjs.com" >> "$dockerhosts"
  echo "129.146.46.7 r.cnpmjs.org" >> "$dockerhosts"
  echo "129.146.46.7 rpm.nodesource.com" >> "$dockerhosts"
  echo -e "执行完成.\n由于个人能力有限无法收集所有的域名.\n欢迎补充。"
  exit
elif [ "$opt" = "恢复" ];then
  cp "$dockerhostsbk" "$dockerhosts"
  echo -e "已成功从备份文件恢复"
  exit
elif [ "$opt" = "退出" ];then
  echo -e "退出成功"
  exit
else
  echo "选择错误自动退出"
fi
done
