## 헤어스타일 변환 경진대회 (Hairstyle Translation AI Competetion)

### 1. 사람의 사진에서 머리카락 영역을 다른 헤어스타일로 변환

헤어스타일 변환 경진대회에 오신 것을 환영합니다!  
마음에 드는 머리스타일을 발견했을 때, 사진을 오려붙이거나 포토샵으로 붙여 본 적이 있습니까? 설령 그렇다고 해도 진짜로 내 머리로 만들어보지 않는 이상은 공주인지 거지인지 알 수 없습니다.  
오직 6개월 이상을 후회할지도 모르는 리스크를 안고 헤어스타일을 시술한 뒤 거울을 보는 수 밖에 없습니다.  

이 기술은 사람들의 6개월짜리 리스크를 10초로 줄여주기 위해 고안되었습니다.   
Generative AI를 이용하여 FID스코어를 최소로 낮추는 것이 해당 대회의 목표입니다.   

다음과 같은 결과물이 나오게 됩니다.  
<img src="https://user-images.githubusercontent.com/77392344/106399821-650d3580-645e-11eb-9a7e-70288c7c02d4.jpg">
예를 들면
1번은 얼굴형이 다른 사람의 헤어스타일을 자신에게 적용해볼 수 있겠죠?
2,3번과 같이 남자가 여자 헤어스타일도 (비교적 자연스럽게) 테스트해볼 수 있습니다.
4번처럼 미묘한 헤어스타일의 변화도 감지할 수 있어야 하며
5번처럼 리스크가 높은 여신컬과 염색을 미리 시도해볼 수 있지요
반대로 6번처럼 현재 머리를 스트레이트하면 어떤느낌이 될 지 알 수 있는 식입니다.

### 2. Baseline model과 dataset
...갑자기 이런 task를 수행하기 어려울 수 있기 때문에 baseline model과 tutorial 을 준비했습니다.  
baseline model은 다음의 github를 참고해 주세요  
<a href="https://github.com/KbeautyHair/KbeautyBaseline">https://github.com/KbeautyHair/KbeautyBaseline</a>  
  
자세한 정보는 해당 모델의 github 페이지에 있으나, 대략 tesla v100 1대 환경에서 3일정도 baseline model을 훈련시켰으니 도움이 많이 될 것이라 생각됩니다.  
해당 모델의 FID score는 <font color=red>14.38점</font> 정도입니다. 이번 대회를 통해 score를 많이 낮추어, 높은 점수를 받을 수 있도록 하면 좋을 것 같습니다.  
  
해당 모델에 사용된 데이터와 동일한 데이터가 모두 이 github의 내부 링크에 공개되어 있습니다.  
<a href="https://github.com/niahair/ganhackerton/tree/master/dataset">https://github.com/niahair/ganhackerton/tree/master/dataset</a>에 약 <b>25만장의 이미지와 레이블</b>이 있습니다. 이 데이터셋으로 대회를 치르게 됩니다.

<b>데이터에 대한 설명</b>은 다음 경로를 참고해 주세요  
<a href="https://github.com/niahair/ganhackerton/blob/master/notebooks/dataset_describe.ipynb">https://github.com/niahair/ganhackerton/blob/master/notebooks/dataset_describe.ipynb</a>  

해당 모델을 이용해 inference하는 과정은 모델의 공식 github에도 있지만, 대회를 위해 좀 더 쉽게 써놓은 <b>코드(튜토리얼)가 다음 링크에 있습니다.</b>  
<a href="https://github.com/niahair/ganhackerton/blob/master/notebooks/main.ipynb">https://github.com/niahair/ganhackerton/blob/master/notebooks/main.ipynb</a>

본 대회에서는 pretrained 혹은 baseline에 fine tuning 모두 허용됩니다. 부디 자유롭게 즐겨주세요!  

### 3. 튜토리얼의 사양
<a href="https://github.com/niahair/ganhackerton/blob/master/notebooks/main.ipynb">튜토리얼</a>은 ubuntu 18.04에서 실행해보았으나 dockerize되어있어 사양을 크게 타지 않습니다.  
실행을 위해서는 다음의 프로그램이 필요합니다.  
nvidia-docker2 runtime 으로 동작하므로 cuda-driver는 최신의 아무거나 깔면 적절합니다. (nvidia-docker2가 돌아갈 수 있는 정도의 버젼이긴 해야합니다.)  

```
docker  
nvidia-docker2  
git  
nvidia-driver    
```

또한 현재 보시는 git에 모든 dataset(약 25만장)이 함께 포함되어 있으므로 clone 시 약 <b>12Gbytes의 저장공간</b>을 차지합니다.  
추가로 튜토리얼에 사용되는 <a href="https://hub.docker.com/r/yuryueng/hbaseline">yuryueng/hbaseline docker image</a>가 약 <b>8Gbytes</b>의 저장공간을 차지합니다.  

다음과 같이 진행하시면 환경 세팅이 됩니다. (ubuntu 18.04LTS기준이며, centos는 거의 대동소이합니다, windows라면 간편하게 gui로 된 exe/msi인스톨러를 다운받아서 nvidia-driver, docker, nvidia-docker를 설치해 보세요)

1. 그래픽카드 드라이버 설치  
```shell
#update apt
$ sudo su
$ apt update && apt upgrade --fix-missing -y
##nvidia 그래픽카드 버젼확인 : tesla k80 같은게 나온다
$ lspci | grep -i nvidia
#os버젼 : x86_64 처럼 나오면 x64
$ uname -m && cat /etc/*release
#gcc 버젼 
$ gcc --version
#gcc가 없으면 설치
$apt install -y gcc
#For ubuntu lts
#이하 nvidia quick install guide에 따름-----
#The NVIDIA driver requires that the kernel headers and development packages for the running version of the kernel be installed at the time of the driver installation, as well whenever the driver is rebuilt. For example, if your system is running kernel version 4.4.0, the 4.4.0 kernel headers and development packages must also be installed.
#The kernel headers and development packages for the currently running kernel can be installed with:
$ sudo apt-get install linux-headers-$(uname -r)
#Ensure packages on the CUDA network repository have priority over the Canonical repository.
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
$ wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
$ sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
#Install the CUDA repository public GPG key. Note that on Ubuntu 16.04, replace https with http in the command below.
$ sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
#Setup the CUDA network repository.
$ echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
#Update the APT repository cache and install the driver using the cuda-drivers meta-package. Use the --no-install-recommends option for a lean driver install without any dependencies on X packages. This is particularly useful for headless installations on cloud instances.
$ sudo apt-get update
$ sudo apt-get -y install cuda-drivers
#Follow the post-installation steps in the CUDA Installation Guide for Linux to setup environment variables, NVIDIA persistence daemon (recommended) and to verify the successful installation of the driver.
#--------nvidia quick install guide는 여기까지
# 제대로 설치결과가 나오면 성공
$ nvidia-smi
# +-----------------------------------------------------------------------------+
# | NVIDIA-SMI 450.36.06    Driver Version: 450.36.06    CUDA Version: 11.0     |
# |-------------------------------+----------------------+----------------------+
# | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
# | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
# |                               |                      |               MIG M. |
# |===============================+======================+======================|
# |   0  Tesla K80           Off  | 00000000:00:1E.0 Off |                    0 |
# | N/A   33C    P0    75W / 149W |      0MiB / 11441MiB |     86%      Default |
# |                               |                      |                  N/A |
# +-------------------------------+----------------------+----------------------+
#
# +-----------------------------------------------------------------------------+
# | Processes:                                                                  |
# |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
# |        ID   ID                                                   Usage      |
# |=============================================================================|
# |  No running processes found                                                 |
# +-----------------------------------------------------------------------------+
```
2. docker 설치
```shell
$ apt install -y docker.io
```
3. nvidia-docker 설치
```shell
#nvidia-smi 에 있는 Driver version에 따라 검증코드가 달라진다. 깔아야 할 nvidia-docker 도 다름.
#최신이라면 최신으로 가도 되지만, nvidia-docker2=2.2.2 를 깔아야할수도 있음.
$ sudo su
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update
#설치
$ apt-get -y install nvidia-docker2
$ pkill -SIGHUP dockerd
#검증. nvidia-smi 창이 뜨면 성공
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
```
4. 이후 다음과 같이 진행하시면 튜토리얼을 진행할 수 있습니다.
```shell
$ #배쉬셀 기준
$ sudo su
$ git clone https://github.com/niahair/ganhackerton.git
$ cd ganhackerton
$ bash run.sh
```
5. 이후 크롬에서 해당 컴퓨터의 8888포트로 접속하면 jupyter notebook이 열립니다.
(ex : http://127.0.0.1:8888 )  
노트북의 main.ipynb는 튜토리얼입니다.  
dataset_describe는 데이터 열어보는 부분입니다.  
노트북에서 shell을 열어 접속하시면 폴더구조는 다음과 같습니다.  
  
/main : 이 git이 clone된 폴더  
/main/dataset/ : 데이터셋이 있는 폴더  
/main/notebooks/ : 노트북들 (/tf/notebooks와 동일한 폴더)  

### 4. Submission 방식과 평가 metric (210208 01:34 am 수정됨)
#### Submission 방식
* 소스 이미지와 타겟 이미지 경로를 입력하여 결과 이미지를 생성할 수 있는 inference.py 파일을 함께 도커이미지에 함께 포함시켜 build를하고 해당 이미지를 도커 허브에 올린 url을 제출해주세요. 
* `inference.py` 에서는 위와 같은 리스트를 바탕으로 dataset 경로에 있는 image 들을 불러와서 source image 를 target image 로 변환한 결과를 `test_image/` directory 에 저장해야합니다.
주최측에서는 inference.py 를 실행시켜 test_image directory 에 변환된 이미지를 저장하고, 이를 바탕으로 FID score 를 측정할 예정입니다.
* 아래는 inference.py 를 실행시킬 inference.sh 의 코드 예시입니다.

```shell
python inference.py
```
* source image file path와 target image file path 가 들어있는 numpy list(inference_filepath.npy) 는 다음과 같습니다.
```
[['dataset/partition1/AP054876-001.jpg' 'dataset/partition1/AP056333-001.jpg']
 ['dataset/partition1/AP054876-003.jpg' 'dataset/partition1/AP056333-003.jpg']
 ['dataset/partition1/AP054876-005.jpg' 'dataset/partition1/AP056333-005.jpg']
  ...
 ['dataset/partition1/AP054876-060.jpg' 'dataset/partition1/AP056333-060.jpg']]
```

#### 주의사항 
* 현재 제공된 inference_filepath.npy 는 실제 테스트 이미지 경로가 아닌 임의의 경로로 구성되어 있습니다.
* 주최측에서 inference.py 를 돌려서 `test_image/` 에 2,000 장의 이미지들이 생성되지 않으면 **시상에서 제외됩니다.**
* 생성할 이미지의 파일형식을 **.png** 로 맞춰주세요. (ex, 1.png, 2.png, etc..)
* 생성할 이미지의 파일명은 임의로 지정하셔도 무방합니다. (ex, 1.png, 001.png, t1.png, etc..)
* 생성할 이미지의 크기는 **512 x 512** 로 맞춰주세요.
* FID Score는 매일 자정에 측정하여 이 github 대문에 업데이트 하게 됩니다.
* 제출은 email 형태로 받게 됩니다. (제출처 : niahairdata@gmail.com)


#### 평가 metric: FID score
* 지정된 2,000 개의 pair로 생성된 2,000 장의 이미지들과 지정된 실제 이미지 2,000 간의 FID score를 측정합니다.
* 생성된 이미지의 사이즈는 512 * 512, 포맷은 png 이어야 하며, 이는 실제 이미지의 사이즈, 포맷과 일치합니다.
* FID score는 수치가 낮을 수록 모델의 성능이 높게 평가됩니다.

### 5. 일정과 기간
대회 일정은 2021.02.02 10시 부터 시작 합니다. 이시간 이후 메일 접수를 집계에 반영 합니다.  
제출 마감은 2021.02.17 23시 59분 까지 입니다.  

그 전에도 dataset이나 baseline model을 살펴보는 것은 자유롭습니다.

### 6. 시상
총 상금은 다음과 같습니다.

<table>
<tr>
<td>순위</td><td>인원</td><td>금액</td>
</tr><tr>
<td>1등</td><td>1명</td><td>1,000,000</td>
</tr><tr>
<td>2등~11등 </td><td>10명</td><td> 500,000</td>
</tr><tr>
<td>12등~21등</td><td>10명</td><td>100,000</td>
</tr>
</table>
</font>

### 7. Leaderboard
리더보드 업데이트 시각은 다음과 같습니다.  

<table>
<tr>
<td>일자</td><td>시간</td>
</tr><tr>
<td>2월 6일</td><td>0시</td>
</tr><tr>
<td>2월 8일</td><td>0시</td>
</tr><tr>
<td>2월 9일</td><td>0시</td>
</tr><tr>
<td>2월 15일</td><td>0시</td>
</tr>
</table>


<table>
<tr>
<td>순위</td><td>FID score</td><td>발신</td><td>팀 이름</td><td>제출 시간</td><td>코멘트</td>
</tr><tr>
<td>1</td><td>14.38</td><td>KbeautyBaseline</td><td>주최측</td><td>2021.1.27 12:13:26</td><td>baseline 모델입니다. 이보다는 낮은 게 좋겠죠!</td>
</tr><tr>
<td>2</td><td>14.38</td><td>ru******96</td><td>이정희</td><td>2021.2.11 07:23:08</td><td> 개인 </td>
</tr><tr>
<td>3</td><td>14.38</td><td>ev******15</td><td>김정운</td><td>2021.2.12 12:13:40</td><td>개인</td>
</tr><tr>
<td>4</td><td>14.38</td><td>md*****og</td><td>박태성</td><td>2021.2.12 13:03:02</td><td>개인</td>  
</tr>
</table>
</pre>

### 8. 문의사항
카카오톡 채널
https://open.kakao.com/o/sDIPrGUc
