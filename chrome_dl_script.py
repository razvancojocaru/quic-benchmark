import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

DOWNLOAD_PATH = os.getcwd()
HAR_PATH = DOWNLOAD_PATH + '/chrome_log_quic.json'
# HAR_PATH = DOWNLOAD_PATH + '/chrome_log_http.json'
CHROME_PATH = '/usr/bin/google-chrome'
CHROME_DRIVER_PATH = DOWNLOAD_PATH + '/chromedriver'

RESOURCE = 'https://quic.clemente.io:6121/html/test100m.dat'
FQDN = 'quic.clemente.io:6121'
# RESOURCE = 'https://localhost/test100m.dat'


def enable_download_in_headless_chrome(browser, download_dir):
    #add missing support for chrome "send_command" to selenium webdriver
    browser.command_executor._commands["send_command"] = (
        "POST",
        '/session/$sessionId/chromium/send_command')
    params = {
        'cmd': 'Page.setDownloadBehavior', 
        'params': {'behavior': 'allow', 'downloadPath': download_dir}}
    browser.execute("send_command", params)

def set_chrome_options():
    chrome_options = Options()
    #chrome_options.add_argument("--headless")
    chrome_options.add_argument('--user-data-dir=/tmp/chrome-profile_test')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('--no-proxy-server')
    chrome_options.add_argument('--enable-quic')
    chrome_options.add_argument('--origin-to-force-quic-on={}'.format(FQDN))
    chrome_options.add_argument('--log-net-log={}'.format(HAR_PATH))
    chrome_options.binary_location = CHROME_PATH
    prefs = {
        'download.default_directory': DOWNLOAD_PATH,
        'download.prompt_for_download': False,
        'download.directory_upgrade': True,
        'safebrowsing.enabled': False,
        'safebrowsing.disable_download_protection': True}
    chrome_options.add_experimental_option('prefs', prefs)
    return chrome_options

def main():
    chrome_options = set_chrome_options()
    driver = webdriver.Chrome(CHROME_DRIVER_PATH,
        chrome_options=chrome_options)
    driver.set_window_size(600, 400)
    enable_download_in_headless_chrome(driver, DOWNLOAD_PATH)
    driver.get(RESOURCE)


if __name__ == '__main__':
    main()
