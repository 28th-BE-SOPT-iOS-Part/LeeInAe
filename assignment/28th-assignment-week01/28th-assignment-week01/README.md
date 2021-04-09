# Segue
 - action segue: 버튼이나 터치와 같은 특정 이벤트에 의해 자동 연결
 - manual segue: 

## action segue
코드가 필요없음! 구성이 간단해지는 장점이 있음

## manual segue
뷰컨과 뷰컨 사이에 연결되는 수동 실행 세그웨이. 특정 이벤트 없이 **수동**으로 실행되어야해서 `performSegue(withIdentifier)` 호출이 필요함 

### unwind (화면 복귀)
새로운 화면으로 전환 - `wind`  
wind 작업을 해제 - `unwind`

+ method로 복귀
  - dismiss()
  - popViewController()
+ exit 아이콘

## unwind segue로 여러 페이지 복귀
unwind segue는 인스펙터 탭에서 연결 여부와 메소드를 확인할 수 있음

만약 FistVC -> SecondVC -> ThirdVC가 네비게이션 컨트롤러로 연결되어있고, **ThirdVC -> FirstVC**로 복귀하려고 할 때!

=> unwind segue를 사용한다.

그러면 스택에 쌓여있던 ThirdVC, SecondVC의 인스턴스 모두 메모리에서 해제된다. 