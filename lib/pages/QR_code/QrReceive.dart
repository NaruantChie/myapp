import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QrReceivePage extends StatelessWidget {
  const QrReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFC5B20), // พื้นหลังสีส้ม
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC5B20), // สีส้มเหมือนพื้นหลัง
        elevation: 0,

        centerTitle: true,
        title: const Text(
          'QR รับเงิน',
          style: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // QR Code
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                 'assets/images/qrcode.png', // ใช้ภาพ QR code จำลอง
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            // ปุ่ม จำนวนเงิน
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  // การทำงานเมื่อกดปุ่ม
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'จำนวนเงิน',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // ปุ่มแชร์
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildShareIconButton(
                  FontAwesomeIcons.whatsapp,
                  'Whatsapp',
                  Colors.green,
                ),
                buildShareIconButton(
                  FontAwesomeIcons.line,
                  'LINE',
                  const Color(0xFF00B900),
                ),
                buildShareIconButton(
                  Icons.link,
                  'Copy Link',
                  Colors.orange,
                ),
                buildShareIconButton(
                  Icons.send,
                  'Others',
                  Colors.orangeAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShareIconButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white, // สีขอบขาวตามตัวอย่างในภาพ
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 30.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Kanit',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
