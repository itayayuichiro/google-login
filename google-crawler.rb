require 'nokogiri'
require 'selenium-webdriver'

class Crawler
	def get_title_text(driver)
		#Nokogiriを用いてHTMLをパースする
		doc = Nokogiri::HTML.parse(driver.page_source, nil, 'utf-8')
		#ユーザー名を取得
		doc.css('h3.r').each do |h3|
			puts h3.text
		end	
	end

	def main
		ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
		#ブラウザ立ち上げモード
		#caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--user-agent=#{ua}", 'window-size=1280x800']})
		#ヘッドレスモード
		caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--headless","--no-sandbox", "--disable-setuid-sandbox", "--disable-gpu", "--user-agent=#{ua}", 'window-size=1280x800']})
		driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps

		#googleのトップページに移動
		driver.navigate.to "https://www.google.co.jp/"
		#google検索フォームに値を入力
		driver.execute_script("document.getElementById('lst-ib').value = '株式会社ルーター'")
		#検索ボタンをクリック
		driver.execute_script("document.getElementsByName('btnK')[0].click()")

		3.times{|i|
			get_title_text(driver)
			driver.execute_script("document.getElementById('pnnext').click()")
			sleep 2
		}
		get_title_text(driver)
	end
end

Crawler.new.main
