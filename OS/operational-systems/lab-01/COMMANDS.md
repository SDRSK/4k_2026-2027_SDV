# Команди для перевірки лабораторної №1

Виконайте з каталогу `lab-01` у GNU Bash:

```bash
bash --version
pwd
whoami
ls -la
ls -la data backup
cat data/measurements.txt
cat data/measurements.txt | sort
cat data/measurements.txt | grep sensor-a
cat data/measurements.txt | wc -l
cat data/measurements.txt | cut -d' ' -f1 | sort -n
cat data/measurements.txt | cut -d' ' -f1 | sort -n | tail -1
cat data/measurements.txt | cut -d' ' -f2 | sort | uniq
cat reports/report.txt
chmod +x setup.sh
./setup.sh
```

## Пояснення
- `sort` — сортує рядки, `sort -n` — числа.
- `grep sensor-a` — залишає рядки з `sensor-a`.
- `wc -l` — рахує рядки.
- `cut -d' ' -f1` — виводить перше поле з роздільником-пробілом.
- `tail -1` — показує останній рядок.
- `uniq` — видаляє сусідні повтори (тому перед ним `sort`).
- `|` — передає вивід попередньої команди на вхід наступної.

## Питання для захисту
1. `pwd` виводить шлях поточного каталогу.
2. `cp` копіює, `mv` переміщує або перейменовує.
3. `grep` відбирає рядки за зразком.
4. `set -euo pipefail`: `-e` зупиняє при помилці команди; `-u` — при використанні невизначеної змінної; `pipefail` — враховує помилки будь-якої команди конвеєра.
5. Надіслати посилання на свій репозиторій `https://github.com/USERNAME/operational-systems`.
