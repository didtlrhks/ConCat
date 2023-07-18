# ConCat
모든내용에 대한 구현은 회사측 깃허브에 private 권한으로써 보여드릴수 없습니다. 
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


6,30-7,4 
firebase와 getx 를 활용하여 chat 기능을 구현하였습니다. 
채팅을 쳤을때 한번만 추가가되었어야했는데 반복을 사용하지않았는데 끊임없이 찍힘과 동시에 firebase 에 데이터가 찍혔습니다.
이를 해결하기 위해서 json seriallize를 시행하였는데 이문제도 아니었고 인스턴스에 입력값이 잘못되어서 그런것이였습니다. 
이를 해결하였습니다.

7,5
채팅방리스트와 채팅방을 구현하는데에 있어서 firebase 를 이용해서 최신메세지를 최신화하는작업을 하였습니다.
이는 streambuilder와 snapshot을 이용해서 최신화를 바로바로 할 수 있도록 하고있습니다.
또한 그에대한 마지막 메세지 시간을 채팅방 리스트에 놓았고 그시간과 채팅방 내용을 ui에 표시하고 있습니다.
채팅방리스트를 최신 시간별로 위부터 정렬하는 로직을 구현하였습니다.


7,6
채팅방리스트에 뜨는 채팅방이름에 대한 이슈가 있습니다. 
자신이 만들었을때 만들어지는 채팅방이름에 대해 상대방이 보았을때는 그 상대편에 닉네임이 나와야하는데 
그러지가않아서 이슈가 있었습니다.
이 이슈를 해결하기 위해 alamofire 에서의 두가지 컬렉션에서 따로 데이터를 받아와서 uid 를 확인하고 검색하여
자신의 participants 가 아닌걸 파악하고 그에대한 닉네임을 채팅방 스크린에 불러다 주는 역할을 수행하는 함수를 
제작하였습니다.

7,7-7,18
구글맵스를 연동했습니다. 구글맵이 필요한 이유로는 상대방의 위치를 채팅방에서 실시간으로 확인할수있어야 하는 요청에 따른 기능입니다.
또한 실시간으로 움직이는 위치를 찍는 기능을 구현했습니다. 백그라운드에서도 이동을 한다면 알람식으로 얼마나 왔는지 확인을 하는식의 기능을 추가하였습니다.
이를 참고하는 것으로 
https://medium.com/flutter-community/flutter-google-map-with-live-location-tracking-uber-style-12da38771829
이 링크를 참고하여 구현해보았습니다. 확실히 주스택 swiftui 보다는 많은 패키지와 라이브러리가 있었고 라이브러리 자체를 사용하는데 코코아팟이나 팟파일을 별도
설치하는것이 아닌 소스내에서 구현과 다운로드를 받을수있어서 공식문서만 잘 참고를 한다면 충분히 좋은 스택으로 가져갈수있을 거라는 생각을 했습니다.
