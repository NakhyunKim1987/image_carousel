import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';  //async 패키지 불러오기

// StatefulWidget 정의
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }

}


// _HomeScreenState 정의
class _HomeScreenState extends State<HomeScreen>{

  // PageController 생성
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
          (timer) {

            // 현재 페이지 가져오기
            int? nextPage = pageController.page?.toInt();

            if (nextPage == null){ // 페이지 값이 없을 때 예외 처리
              return ;
            }

            if (nextPage == 4){ // 첫 페이지와 마지막 페이지 분기 처리
                nextPage = 0;
            }else{
              nextPage++;
            }

            pageController.animateToPage( // 페이지 변경
              nextPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );

      },
    );

  }

  @override
  Widget build(BuildContext context) {

    // 상태바 색상 변경
    // 상태바가 이미 흰색이면 light 대신 dark를 주어 검정색으로 바꾸자
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView( // PageView 추가
        controller: pageController, // PageController 등록
        children: [1,2,3,4,5] //샘플 리스트 생성
            .map((number) => Image.asset(
              'asset/img/image_$number.jpeg',
              fit: BoxFit.cover,  // BoxFit.cover 설정
          ),
        ).toList(),
      ),
    );

  }


}