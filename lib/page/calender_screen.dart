import 'package:flutter/material.dart'; // Flutter의 기본 위젯들을 임포트
import 'package:table_calendar/table_calendar.dart'; // 테이블 캘린더 라이브러리 임포트

class CalendarScreen extends StatefulWidget {
  // 상태를 가지는 캘린더 화면 위젯
  @override
  _CalendarScreenState createState() => _CalendarScreenState(); // 상태 객체 생성
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now(); // 현재 포커스된 날짜 (기준이 되는 날짜)
  DateTime? _selectedDay; // 선택된 날짜 (null일 수 있음)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 전체 화면의 구조 제공
      appBar: AppBar(
        // 상단 앱바
        title: Text('직관 기록'), // 타이틀 텍스트
        leading: IconButton(
          // 왼쪽 뒤로가기 버튼
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // 이전 화면으로 돌아가기
        ),
        actions: [
          IconButton(
            // 오른쪽 상단 + 버튼
            icon: Icon(Icons.add),
            onPressed: () {
              // TODO: Add action
            },
          ),
        ],
      ),
      body: Column(
        // 화면의 본문을 세로로 나열
        children: [
          SizedBox(height: 16), // 상단 여백
          Text(
            '${_focusedDay.year}년 ${_focusedDay.month}월', // 현재 포커스된 월/년 표시
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TableCalendar(
            // 테이블 캘린더 위젯
            locale: 'ko_KR',
            // 한국어 로케일 설정
            firstDay: DateTime.utc(2020, 1, 1),
            // 캘린더 시작 날짜
            lastDay: DateTime.utc(2030, 12, 31),
            // 캘린더 끝 날짜
            focusedDay: _focusedDay,
            // 현재 포커스 날짜 지정
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            // 어떤 날짜가 선택됐는지 정의
            onDaySelected: (selectedDay, focusedDay) {
              // 날짜를 선택했을 때 동작
              setState(() {
                _selectedDay = selectedDay; // 선택 날짜 저장
                _focusedDay = focusedDay; // 포커스 날짜 업데이트
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              // 캘린더 스타일 정의
              todayDecoration: BoxDecoration(
                color: Colors.grey[300], // 오늘 날짜 배경색
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.redAccent, // 선택된 날짜 배경색
                shape: BoxShape.circle,
              ),
            ),
            headerVisible: false,
            // 기본 헤더 숨김 (직접 연도/월 텍스트로 대체)
            calendarFormat: CalendarFormat.month,
            // 달 보기 형식
            daysOfWeekHeight: 30, // 요일 행 높이
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // 하단 탭 바
      type: BottomNavigationBarType.fixed,
      // 고정형 탭
      selectedFontSize: 12,
      // 선택된 탭의 글자 크기
      unselectedFontSize: 12,
      // 선택 안된 탭의 글자 크기
      items: const [
        // 각 탭 항목들
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '예측'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: '오늘의경기'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '기록'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: '응원'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],
      currentIndex: 2,
      // 현재 선택된 탭 인덱스 (기록)
      onTap: (index) {
        // TODO: Handle tab navigation
      },
    );
  }
}
