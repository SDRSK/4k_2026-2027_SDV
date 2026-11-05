# Operational Systems

**Студент:** [Садурський Дмитро]  
**Група:** [ІПЗ-42]

## Лабораторна робота №1
**Тема:** Навігація, маніпулювання файловою ієрархією та базова фільтрація даних у GNU Bash.

**Мета:** Навчитися працювати в GNU Bash, керувати файлами та каталогами й опрацьовувати текстові дані командами `sort`, `grep`, `wc`, `cut`, `tail`, `uniq` і конвеєрами.

**Файли:** `lab-01/data/`, `lab-01/backup/`, `lab-01/reports/report.txt`, `lab-01/setup.sh`.

### Запуск
```bash
cd lab-01
chmod +x setup.sh
./setup.sh
cat reports/report.txt
```

### Перший крок — перевірка середовища
```bash
bash --version
pwd
whoami
```

Результати перевірки оболонки та ім'я користувача запишіть за результатами виконання на власному комп'ютері.

## Лабораторна робота №2 — Системні виклики ядра Linux для роботи з файловими дескрипторами

У каталозі `lab-02/` розміщені `fd_demo.c`, `copy_file.c`, тестові файли `notes.txt` та `notes-copy.txt`, пояснення у `lab-02/README.md`.

Команди для перевірки:

```bash
cd lab-02
gcc -Wall -Wextra -pedantic -o fd_demo fd_demo.c
./fd_demo
gcc -Wall -Wextra -pedantic -o copy_file copy_file.c
./copy_file notes.txt notes-copy.txt
cmp notes.txt notes-copy.txt
```

## Лабораторна робота №3 — Керування життєвим циклом процесів у C/Linux

У папці [`lab-03`](lab-03/) розміщено програми `process_demo.c` (`fork` + `execlp` + `waitpid`) і `worker_children.c` (три нащадки, аналіз кодів виходу та сигналів). Інструкції, експерименти та відповіді на захист: [`lab-03/README.md`](lab-03/README.md).

Команди компіляції та запуску (в Linux/WSL):

```bash
cd lab-03
gcc -Wall -Wextra -pedantic -o process_demo process_demo.c
./process_demo
gcc -Wall -Wextra -pedantic -o worker_children worker_children.c
ulimit -c 0
./worker_children
```
