# CJ 더마켓 고객 예측 모델링 대회 

<br/>

## 1. 배경 및 목적

- 2023년도 1월 CJ 더마켓 고객 주문 데이터를 활용하여 실제 예측 모델링 진행
- CJ 더마켓의 1)일반회원과 2)임직원의 프라임 회원을 예측하는 모델링

<br/>

## 2. 주최 기관

- 주최 : (사)한국빅데이터학회
- 주관 : BDA (Big Data Analytics)
- 후원 : CJ제일제당
- 협력 학회 및 동아리 : KUBIG, KHUDA, ESC, ESAA, DArt-B, D&A

<br/>

## 3. 대회 기간

- 참가접수기간: 2023.4.18.~2023.4.23.
- 1차 제출 마감: 2023.5.9.(23:59)
- 예선심사: 2023.5.10.~2023.5.17.
- 예선심사 결과 발표 및 본선 데이터 공개: 2023.5.18.
- 모델링 중간점검: 2023.5.26.
- 본선 결과물 제출 마감: 2023.6.1.(23:59)
- 본선 발표 심사: 2023.6.4.
- 본선 결과 발표: 2023.6.14.
- 컨퍼런스 발표 및 시상: 2023.6.24
  
<br/>




## 4. 과정   
![Un](https://github.com/Ji-eun-Kim/Big-Data-Processing-n-Visualization/assets/124686375/2e510029-0789-4dc0-8bf9-c811c6984fcd)  
본 대회는 2023년도 1월 CJ 더마켓 고객 주문 데이터를 활용하여 실제 예측 모델링을 진행하는 것으로,  **EDA-전처리-피처엔지니어링-모델링**순으로 진행하였다.  

본격적인 EDA를 진행하기 전, **3가지 공통 특성을 정의**하였다. 이 3가지 정보는 프라임회원 여부 결정에 주요한 영향을 미치는 요인들로, 컬럼 별 특성에 따라 target 값을 제외한 7가지 기존 컬럼을 이와 같은 3가지 관점으로 분류하였다. 이후 target 값 분석 및 임직원/비임직원 데이터를 분석하여 각 데이터의 특성들을 기반으로 데이터 전처리 및 피처 엔지니어링을 진행하였다.    

![Un](https://github.com/Ji-eun-Kim/Big-Data-Processing-n-Visualization/assets/124686375/c116280a-6c1f-452c-a335-33ef093ac1fe)  

피처의 경우 **총 60개** 를 생성하였고, 공통 특성에 따라 피처를 분류한 후 각 특성에 따른 EDA결과를 바탕으로 피처를 생성하였다. 추가된 변수들은 학습시 다양한 관점을 부여해 성능 향상에 기여할 것으로 예상하였고, 각 변수들은 **프라임회원 여부에 영향을 미칠 것 같은 컬럼**들을 선별하여 생성성하였다.   
**Feature selection**을 진행한 결과, **상품 정보**와 관련된 피처들의 중요도가 높았다. 1인당 총 구매 수량과 구매상품의 개당 가격의 평균, 전체 상품 가격 등의 컬럼이 중요도 TOP3를 차지하였다. 공통적으로 앞서 설정한 3가지 공통 정보 중 **상품 정보**에 가장 민감했으며, 특히 **수치형 변수**가 중요도에 많은 영향을 미침을 확인하였다. 추가적으로 **구매자의 특성에 따라 product_name을 세분화** 하여 피처를 생성하기도 했다. CJ 더마켓의 추천 상품들은 **카테고리별로 분류**하여, 해당 상품들은 구매한 고객들이 프라임회원인지 그 여부를 확인하고자 하였다.  

   Data split의 경우, Validataion Dataset을 구성하였고, size는 0.3으로 설정하였다. 또한 주어진 데이터 셋이 imbalanced data는 아니었으나, 데이터를 보다 균형있게 조절하기 위해 **Stratified-Kfold** 를 통한 교차검증 또한 진행해주었다.   

모델링은 총 4 가지 모델을 사용하여 실험을 진행하였다. **트리 모델(Random Forest), 부스팅 모델(LightGBM, CatBoost), 딥러닝 모델(TabNet)을 사용**하였다. 위의 모델을 선택한 이유는 다음과 같았다. 트리 모델의 경우, **classification 모델에서 유용**하다는 장점을 활용하고자 실험하였으며, 부스팅 모델의 경우, **weight 조절이 가능하다는 점과 불균형 데이터에서 좋은 성능**을 보여 선택하였다. 또한 딥러닝 모델인 TabNet도 실험하였는데, **정형 데이터를 처리**하는 모델이며 어떠한 feature에 집중할지 **모델이 스스로 결정해서 학습**한다는 이점을 통해 총 4가지 모델에 대해 실험을 진행하였다. 추가적으로 **과적합 요소**의 우려와 무거운 모델을 사용하고 싶지 않았기에 앙상블은 따로 진행하지 않았다. **하이퍼파리미터 튜닝**를 통해 학습시킨 결과, 최고 성능인 **Catboost 0.885, 0.819 모델**을 최종 모델로 선정하였다.  


<br/>


## 5. 팀원 및 담당 역할
<팀원> 
전공생 4명


<담당 역할>    
탐색적 데이터 분석
Feature Engineering  
Modeling 구현  





## 6. 자료
https://www.instagram.com/p/CrKhMqjJeBI/?utm_source=ig_web_copy_link&igshid=MzRlODBiNWFlZA==    

<img width="336" alt="스크린샷 2023-07-20 214948" src="https://github.com/Ji-eun-Kim/Big-Data-Processing-n-Visualization/assets/124686375/cda6fced-fd4f-4e47-b654-502384883435"> <br/>



<br/>

 
- 발표 자료  
https://drive.google.com/file/d/1E-yB6vIGeNtKE5IBu0BO_VE71vC_hzBc/view?usp=drive_link


<br/>

- 증빙 자료  
https://www.instagram.com/p/CsTu3aNp8Bh/?utm_source=ig_web_copy_link&igshid=MzRlODBiNWFlZA%3D%3D  
<img width="475" alt="cj6" src="https://github.com/Ji-eun-Kim/Big-Data-Processing-n-Visualization/assets/124686375/8d89b943-889f-4e72-b8e7-5bb3a478211c">
