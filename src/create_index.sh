# Stemmer code
#arg0
# collection path
# arg1
	# 0: default stemmer
	# 1: EnglishStemmer​
	# 2: EnglishStemmer​StopWords

echo "arg0 $1" 
echo "arg1 $2" 
if [ "$2" -eq 0 ]; then
	echo "default stemmer used";
	java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -S "$1" cran;
elif [  "$2" -eq 1 ]; then
	echo "english stemmer used";
	java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -S "$1" -t it.unimi.di.big.mg4j.index.snowball.EnglishStemmer cran;
elif [  "$2" -eq 2 ]; then
	echo "english stemmer stop word used";
	java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -S "$1" -t homework.EnglishStemmerStopwords cran;
else echo "ERRORE!";
fi
# ****** Scorer ******
#Default: BM25Scorer, VignaScorer

#ConstantScorer. Each document has a constant score (default is 0)
#$score ConstantScorer

# CountScorer. It is the product between the number of occurrences of the term in the document and the weight assigned to the index
#$score CountScorer

# TfIdfScorer: implements Tf/Idf
#$score TfIdfScorer
