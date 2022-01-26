killall iprp-backend_am
echo "\n\n\n--------------------END------------------ \n\n\n----------------------START-----------------\n\n\n" >> ~/iprpLog/iprp.log
cd ~
rm -r iprpBuild
mkdir iprpBuild
cd iprpBuild

wget https://github.com/IPRP/Peer-Review-Platform-Backend/releases/download/latest-dev/ubuntu-build.zip
unzip ./"ubuntu-build.zip"
rm ./"ubuntu-build.zip"

cp release/iprp-backend_amd64 iprp-backend_amd64
cp -r release/resources resources
cp ~/Dockerfile ~/iprpBuild/Dockerfile
#rm ~/iprpBuild/Rocket.toml
cp ~/Rocket.toml ~/iprpBuild/Rocket.toml
rm -r release

cd ~/iprpBuild

./iprp-backend_amd64 >> ~/iprpLog/iprp.log 2>&1 &
