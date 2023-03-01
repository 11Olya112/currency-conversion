#!/usr/bin/env sh
# перервати через помилки
встановити -е
# будувати
пряжа біг буд
# перейдіть до вихідного каталогу збирання
cd dist
# якщо ви розгортаєте власний домен
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:11Olya112/currency-conversion.git master:gh-pages
cd -