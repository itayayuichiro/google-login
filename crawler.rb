require 'nokogiri'
require 'selenium-webdriver'
ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
#ブラウザ立ち上げモード
#caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--user-agent=#{ua}", 'window-size=1280x800']})
#ヘッドレスモード
caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--headless","--no-sandbox", "--disable-setuid-sandbox", "--disable-gpu", "--user-agent=#{ua}", 'window-size=1280x800']})
driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps

#googleのトップページに移動
driver.navigate.to "https://www.google.co.jp/"
#googleのログインフォームに移動
driver.navigate.to "https://accounts.google.com/ServiceLogin?hl=ja&passive=true&continue=https://www.google.co.jp/"
sleep 2
#ログインフォームにidを入力&次へボタンをクリック
driver.execute_script("document.getElementById('identifierId').value = 'sample@gmail.com'")
driver.execute_script("document.querySelector('#identifierNext').click()")
sleep 2
#ログインフォームにパスワードを入力&次へボタンをクリック
driver.execute_script("document.querySelector('.zHQkBf').value='password'")
driver.execute_script("document.querySelector('#passwordNext').click()")
sleep 2

#Nokogiriを用いてHTMLをパースする
doc = Nokogiri::HTML.parse(driver.page_source, nil, 'utf-8')
#ユーザー名を取得
p doc.css('.gb_Hb').text
