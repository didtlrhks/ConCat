# ConCat

6.26 

친구탭을 이용한 1대1 채팅 구현 
flutter 학습

firebase 사용법 학습

issue 
-파이어베이스에 파라미터형식이 달라서 오류 났던 경우가 있음. 
오류내용 The following StateError was thrown building StreamBuilder<QuerySnapshot<Map<String,
dynamic>>>(dirty, dependencies: [MediaQuery], state:
_StreamBuilderBaseState<QuerySnapshot<Map<String, dynamic>>, AsyncSnapshot<QuerySnapshot<Map<String,
dynamic>>>>#3fd4d):
Bad state: field does not exist within the DocumentSnapshotPlatform
이내용이 해당 오류이다. 이내용이 있다면 파이어베이스 문서형식 확인하기 

6.27,8,9

firebase 를 사용하여 Get함수,Getback 함수 then 함수,set 함수등을 활용하여 메소드를 만들어서 채팅신청 버튼을 눌렀을 때 해당 
chatroom id 를 가지고 있는 채팅방을 생성하는 로직을 구현하였습니다.
원래 로그인 단계에서 로그인을 구현을 했다면 이런일은 없겠지만 이번회사에서 만들어보는 어플은 익명으로 로그인을 하기때문에 랜덤문자열을 뽑아주는
함수를 사용하여 인증을 하는 방법을 사용합니다.
