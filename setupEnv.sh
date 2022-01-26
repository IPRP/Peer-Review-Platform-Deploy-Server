#!/bin/bash
echo "-----------------Start SetupENV: selenium---------------" >> ~/iprpLog/iprp.log

echo "----SetupENV: rename localhost:8081 to iprp.dergeorg.at n" >> ~/iprpLog/iprp.log
sed -i 's/localhost:8081/iprp.dergeorg.at/g' ~/www/tests/unittests.py >> ~/iprpLog/iprp.log

echo "----SetupENV: rename "geckodriver.exe" to /home/inno/geckodriver n" >> ~/iprpLog/iprp.log
sed -i 's/"geckodriver.exe"/"\/home\/inno\/geckodriver"/g' ~/www/tests/unittests.py >> ~/iprpLog/iprp.log


echo "----SetupENV: rename http: to https: " >> ~/iprpLog/iprp.log
sed -i 's/http:/https:/g' ~/www/tests/unittests.py >> ~/iprpLog/iprp.log


echo "----SetupENV: add Firefoxoptions --headless " >> ~/iprpLog/iprp.log
sed -i 's/def setUp(self):/def setUp(self):\n        from selenium.webdriver import FirefoxOptions \n        opts = FirefoxOptions() \n        opts.add_argument("--headless")/g' ~/www/tests/unittests.py >> ~/iprpLog/iprp.log



echo "----SetupENV: rename executable_path to firefox_options=opts,executable_path" >> ~/iprpLog/iprp.log
sed -i 's/executable_path/options=opts,executable_path/g' ~/www/tests/unittests.py >> ~/iprpLog/iprp.log

echo "----------------END SetupEnv: selenium-------------------" >> ~/iprpLog/iprp.log

echo "----------------Start Selenium Unit-Tests----------------" >> ~/iprpLog/iprp.log 

echo "wait for 20 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 18 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 17 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 16 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 15 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 14 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 13 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 12 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 11 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 10 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 9 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 8 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 7 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 6 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 5 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 4 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 3 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 2 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "wait for 1 sek" >> ~/iprpLog/iprp.log
sleep 1
echo "starting selenium" >> ~/iprpLog/iprp.log



python3 ~/www/tests/unittests.py -v > ~/iprpLog/selenium.log 2>&1


seleniumres=$( tail -n 1 ~/iprpLog/selenium.log)

echo $seleniumres >> ~/iprpLog/iprp.log

SUB='FAILED'
if [[ "$seleniumres" == *"$SUB"* ]]; then
  tail -n 50 ~/iprpLog/selenium.log >> ~/iprpLog/iprp.log
  echo "-------------------------------FAILED Selenium Unit-Tests----------------------------------" >> ~/iprpLog/iprp.log
  exit 123
fi


echo "----------------END Selenium Unit-Tests------------------" >> ~/iprpLog/iprp.log