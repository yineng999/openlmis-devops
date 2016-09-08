export BUILD_ID=dontKillMe
set +x
source ~/.bashrc
set -x
echo $CUBES_BUILDNO

ansible-playbook -u ubuntu --private-key=/var/lib/jenkins/.ssh/openlmis.pem deployment/deploy-to-prodsim.yml --extra-vars "BUILD_NO=$CUBES_BUILDNO"