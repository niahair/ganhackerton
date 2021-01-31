echo "init path = "
SCRIPTPATH=$(cd "$(dirname "$0")" && pwd)
echo ${SCRIPTPATH}
echo "cleanup"
docker stop ganhairdata
docker rm ganhairdata
echo "docker pull yuryueng/ganhackertonbaseline"
docker pull yuryueng/ganhackertonbaseline
echo "docker run ganhairdata"
SHAREDMEM=$(df -kh /dev/shm | egrep -o -e "[0-9]+[A-Z]" | head -1)
echo "with shm ${SHAREDMEM}"
SETTING_DIR_NAME=$(echo "gpu_debug")
docker run --runtime=nvidia -d -p 8888:8888 -e SHELL=bash -v ${SCRIPTPATH}/:/main -v ${SCRIPTPATH}/jupyter_settings/ipython_config/${SETTING_DIR_NAME}/ipython_config.py:/root/.ipython/profile_default/ipython_config.py -v ${SCRIPTPATH}/jupyter_settings/jupyter_lab_config/${SETTING_DIR_NAME}/jupyter_lab_config.py:/root/.jupyter/jupyter_notebook_config.py -v ${SCRIPTPATH}/notebooks:/tf/notebooks:z -v ${SCRIPTPATH}/jupyter_settings/user-settings/${SETTING_DIR_NAME}:/root/.jupyter/lab/user-settings/@jupyterlab -e GRANT_SUDO=yes --shm-size=${SHAREDMEM} --user root --name ganhairdata --privileged yuryueng/ganhackertonbaseline
echo "Finished"

