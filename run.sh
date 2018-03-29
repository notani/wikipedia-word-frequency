DATE=$1

for lang in de en es fr it ru zh
do
    if [ -e results/${lang}wiki-${DATE}-words-frequency.txt ]; then
        continue
    fi

    # 1. Download
    if [ ! -d dumps.wikimedia.org/${lang}wiki/${DATE}/ ]; then
        cmd="wget -np -r --accept-regex 'https://dumps.wikimedia.org/${lang}wiki/${DATE}/${lang}wiki-${DATE}-pages-articles[0-9].*' https://dumps.wikimedia.org/${lang}wiki/${DATE}/"
        echo $cmd
        eval $cmd
    fi

    # 2. Count
    cmd="python ./gather_wordfreq.py dumps.wikimedia.org/${lang}wiki/${DATE}/*.bz2 > results/${lang}wiki-${DATE}-words-frequency.txt"
    echo $cmd
    eval $cmd
done
