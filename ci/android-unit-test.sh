set +x
source ~/.bashrc
set -x
echo $BUILD_NUMBER

chmod +x scripts/ci.sh
./scripts/ci.sh