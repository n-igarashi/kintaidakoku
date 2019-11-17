
# 毎朝の勤怠の打刻を忘れるので作ったもの
PCが立ち上がっていればteamspilitの打刻をやってくれるもの

## 必要なもの
PC(Mac用に作った)
selenium
ChromeDriver
python 3系

# 使い方

`initial.command` を実行。
色々聞かれるので入力する→config.txtに出力される。
```Bash :config.txt
#config.txt

id=yourid
pass=password

#pythonのパス
pythonPath=/usr/local/var/pyenv/shims/python

#ChromeDriverのパス
chromeDPath=/usr/local/bin/chromedriver

#pathはwhichコマンドでわかる
```

`kintaidakoku.py`の編集
```Bash :kintaidakoku.py
#kintaidakoku.py

#ここにURLを入れる
driver.get("https://teamspirit-****.cloudforce.com/home/home.jsp")
```

PCのcronを設定
```Bash :/temp/clontab
$ crontab -e


#/temp/clontab

#pathは配置した場所で
#9時55分に毎日実行する場合
55 09 * * * /bin/sh /Users/[username]/project/kintaidakoku/forCron.sh
```