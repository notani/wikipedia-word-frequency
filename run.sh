DATE=$1

for lang in en es fr it
do
    if [ -e results/${lang}wiki-${DATE}-words-frequency.txt ]; then
        continue
    fi

    # 1. Download
    if [ ! -d https://dumps.wikimedia.org/${lang}wiki/${DATE}/ ]; then
        echo "wget -np -r --accept-regex 'https://dumps.wikimedia.org/${lang}wiki/${DATE}/${lang}wiki-${DATE}-pages-articles[0-9].*' https://dumps.wikimedia.org/${lang}wiki/${DATE}/"
    fi

    # 2. Count
    echo "python ./gather_wordfreq.py dumps.wikimedia.org/${lang}wiki/${DATE}/*.bz2 > results/${lang}wiki-${DATE}-words-frequency.txt"
done
