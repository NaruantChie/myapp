import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    int counter = 0;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$counter', key: Key('counterText')),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));

    // ตรวจสอบว่า counter เริ่มต้นที่ 0
    expect(find.byKey(const Key('counterText')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // กดปุ่ม '+' และทริกเกอร์เฟรมอีกครั้ง
    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pumpAndSettle();

    // ตรวจสอบว่า counter เพิ่มเป็น 1
    expect(find.text('1'), findsOneWidget);
  });
}
