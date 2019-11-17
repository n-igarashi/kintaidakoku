#!/bin/bash

cd $(dirname $0)
echo "=========================================================================="
echo ""
echo "　　TeamSpiritの出勤打刻を忘れないようにするやつ"
echo "　　初期設定します。"
echo "　　IDとPASSを入力してください。"
echo "    ※python3,selenium必要"
echo ""
echo "=========================================================================="

#check python chrome driver
pythonPath=`which python`
chromeDPath=`which chromedriver`

if [ $pythonPath ]; then
  pythonVer=`python -V`
  pythonVer=${pythonVer:7:1}
  if [ $pythonVer -eq '3' ]; then
    echo 'Python3:OK'
  else
    echo "Python3をインストールしてください。"
    exit 1
  fi
else
  echo "pythonがインストールされていません。"
  echo "python3をインストールしてから実行してください。普通の Python 3.*.* とかで・・・"
  sleep 5
  exit 1
fi

if [ $chromeDPath ]; then
  echo "chromedriver:OK"
else
  echo "chromedriverをインストールしてください。"
fi



printf "Mail Address(ID)? : "
read l_id

printf "Password? : "
read l_pw 


echo "pythonは ${pythonPath} を使用します。"
printf "こちらでよろしいですか？ [Y/n] "
read YN
case $YN in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" )
      echo "設定しました。"
      ;;
    * )
      echo "pythonのpathを入力してください"
      read pythonPath
      echo "設定しました。"
      ;;
esac

printf ""> config.txt
echo "id=${l_id}">> config.txt
echo "pass=${l_pw}">> config.txt
echo "pythonPath=${pythonPath}">> config.txt
echo "pythonPath=${pythonPath}">> config.txt
echo "chromeDPath=${chromeDPath}">> config.txt

echo "ID : ${l_id}"
echo "PASS : ${l_pw}"
echo "Python PATH : ${pythonPath}"
echo "ChromeWebDriver PATH : ${chromeDPath}"
echo ""
echo "間違えがあった場合は、再度実行してください。"

sleep 10

killall Terminal