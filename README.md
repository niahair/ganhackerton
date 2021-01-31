<pre>
<h3>헤어스타일 변환 경진대회</h3>
Hairstyle Translation AI Competetion
- 사람의 사진에서 머리카락 영역을 다른 헤어스타일로 변환 -

헤어스타일 변환 경진대회에 오신 것을 환영합니다!
마음에 드는 머리스타일을 발견했을 때, 사진을 오려붙이거나 포토샵으로 붙여 본 적이 있습니까? 설>령 그렇다고 해도 진짜로 내 머리로 만들어보지 않는 이상은 공주인지 거지인지 알 수 없습니다.
오직 6개월 이상을 후회할지도 모르는 리스크를 안고 직접 한 뒤 거울을 보는 수 밖에 없습니다.

이 기술은 사람들의 6개월짜리 리스크를 10초로 줄여주기 위해 고안되었습니다.
Generative AI를 이용하여 FID스코어를 최소로 낮추는 것이 해당 대회의 목표입니다.


<h3>baseline model과 dataset에 대한 설명</h3>
...갑자기 이런 task를 수행하기 어려울 수 있기 때문에 baseline model과 tutorial 을 준비했습니다.
baseline model은 다음의 github를 참고해 주세요
<a href="https://github.com/KbeautyHair/KbeautyBaseline">https://github.com/KbeautyHair/KbeautyBaseline</a>

자세한 정보는 해당 모델의 github 페이지에 있으나, 대략 tesla v100 1대 환경에서 3일정도 baseline model을 훈련시켰으니 도움이 많이 될 것이라 생각됩니다.
해당 모델의 FID Score는 <font color=red>74점</font> 정도입니다. 이번 대회를 통해 score를 많이 낮추어, 높은 점수를 받을 수 있도록 하면 좋을 것 같습니다.

해당 모델에 사용된 데이터와 동일한 데이터가 모두 이 github에 공개되어 있습니다.
<a href="https://github.com/niahair/ganhackerton/tree/master/dataset">https://github.com/niahair/ganhackerton/tree/master/dataset</a>에 약 25만장의 이미지와 레이블이 있습니다.

데이터에 대한 설명은 다음 경로를 참고해 주세요
<a href="https://github.com/niahair/ganhackerton/blob/master/notebooks/dataset_describe.ipynb">https://github.com/niahair/ganhackerton/blob/master/notebooks/dataset_describe.ipynb</a>

해당 모델을 이용해 inference하는 과정은 모델의 공식 github에도 있지만, 대회를 위해 좀 더 쉽게 써놓은 코드가 다음 링크에 있습니다.
<a href="https://github.com/niahair/ganhackerton/blob/master/notebooks/main.ipynb">https://github.com/niahair/ganhackerton/blob/master/notebooks/main.ipynb</a>

본 대회에서는 pretrained 혹은 baseline에 fine tuning 모두 허용됩니다. 부디 자유롭게 즐겨주세요!


<h3>submmit 방식과 평가 metric에 대한 안내</h3>
<font color=red>
submmit은 다음과 같이 이루어집니다.
1) 지정된 dataset의 입력 그림파일과 style 그림파일에 대해 inference한 결과물을 올려 주세요
블라블라

2) 파일 이름은 다음과 같이 지정되어야 합니다.
블라블라

3) FID Score는 매일 자정에 측정하여 이 github 대문에 업데이트 하게 됩니다.

제출은 email 형태로 받게 됩니다. (제출처 : niahairdata@gmail.com)
반드시 model 의 가중치와 sourcecode 를 함께 전송해주세요.
</font>

<h3>일정과 기간, 시상</h3>
<font color=red>
<h4> ※주의 : 이 부분은 미정이며 대회 시작전에 fix됩니다. 숫자들은 전부 임의로 넣은 것입니다.</h4>

대회 일정은 2021.02.05 00:00:00부터 시작됩니다.
최종 제출 마감은 2021.02.12 23:59:59 입니다.

그 전에도 dataset이 baseline model을 살펴보는 것은 자유롭습니다.

총 상금은 다음과 같이 주어집니다.

<table>
<tr>
<td>순위</td><td>금액</td>
</tr><tr>
<td>1등</td><td>1명</td><td>1,000,000</td>
</tr><tr>
<td>2등</td><td>1명</td><td>500,000</td>
</tr><tr>
<td>3등</td><td>1명</td><td>100,000</td>
</tr><tr>
<td>4등</td><td>2명</td><td>50,000</td>
</tr>
</table>

<table>
<tr>
<td>순위</td><td>FID score</td><td>모델명</td><td>모델 github 또는 paper url</td><td>팀 이름</td><td>제출 시간</td><td>코멘트</td>
</tr><tr>
<td>1</td><td>34.4</td><td>KbeautyBaseline</td><td><a href="https://github.com/KbeautyHair/KbeautyBaseline">https://github.com/KbeautyHair/KbeautyBaseline</a></td><td>주체측</td><td>2021.1.27 12:13:26</td><td>baseline 모델입니다. 이보다는 높은게 좋겠죠!</td>
</tr>
</table>
</pre>

