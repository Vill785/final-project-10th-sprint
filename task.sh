#!/bin/bash

# создаём каталог task с вложенными директориями
mkdir -p task
mkdir -p task/dir1
mkdir -p task/dir2
mkdir -p task/dir3/dir4

# изменяем текущую директорию на task
cd task

# создаём пустой файл dir2/empty
touch dir2/empty

# создаём файл dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo '#!/bin/bash' > dir2/hello.sh
echo 'echo "$1, привет!"' >> dir2/hello.sh
chmod +x dir2/hello.sh

# устанавливаем для dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh

# сохраняем список файлов dir2 в dir2/list.txt
ls dir2 > dir2/list.txt

# копируем содержимое каталога dir2 в каталог dir3/dir4
cp -r dir2/* dir3/dir4

# записываем в dir1/summary.txt список файлов с расширением *.txt
# находящихся в текущей директории (включая поддиректории)
find . -type f -name "*.txt" > dir1/summary.txt

# дописываем в dir1/summary.txt содержимое dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"
export NAME="Всем студентам"

# запускаем dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл dir1/summary.txt
dir2/hello.sh "$NAME" >> dir1/summary.txt

# перемещаем с переименованием dir1/summary.txt в "Практическое задание"
mv dir1/summary.txt 'Практическое задание'

# выводим на консоль содержимое файла "Практическое задание"
cat 'Практическое задание'

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" 'Практическое задание' | sort

# меняем текущую директорию на родительскую для task
cd ..

# удаляем директорию task со всем содержимым
rm -rf task
