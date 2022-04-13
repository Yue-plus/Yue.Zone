# 构建 web 生产版本
flutter build web
cd ./build/web/ || exit
echo 'yue.zone' > CNAME
git init
git add ./*
git commit -m 'Flutter build Web'
git push -f git@github.com:Yue-plus/Yue.Zone.git main:gh-page