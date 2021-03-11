
# 自動化するためのgemとchrome読み込み
require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "../../Downloads/chromedriver"

d = Selenium::WebDriver.for :chrome
# ページの読み込みが完了するまで待つ、ただ10秒待っても完了しなければタイムアウト（処理を中断）
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# ここまで


# サイトアクセスするページ読み込み
d.get("https://typing.twi1.me/game/18144")

# デベロッパーツールで確認
d.find_element(:class, 'mtjSeSc-settingBtn').click

# スペースキー押してから時間のずれがあるのでsleepメソッドで時間を挟む
sleep(2)
d.find_element(:css, 'body').send_keys(:space)
sleep(2)
d.find_element(:css, 'body').send_keys(:space)

loop do
  text = d.find_element(:css, '.mtjGmSc-roma .mtjNowInput').text
  d.find_element(:css, 'body').send_keys(text)
end