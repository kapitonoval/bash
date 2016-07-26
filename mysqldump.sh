#!/bin/bash 
 
# переходим в каталог, где находится скрипт
cd /DIR_NAME/

# делаем резервную копию базы данных MySQL на сервере
mysqldump -uroot  -PASSWORD BASE_NAME | gzip > ./db-name-`date "+%Y-%m-%d"`.sql.gz

# удаляем резервные копии старше двух недель
# find ./backups -mtime +7 -print -delete
