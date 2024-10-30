import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // สำหรับไอคอน

class TransitionPage extends StatelessWidget {
  const TransitionPage(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildDraggableSheet({required ScrollController scrollController}) {
    return DraggableScrollableSheet(
      initialChildSize: 0.74,
      minChildSize: 0.25,
      maxChildSize: 0.75,
      builder: (BuildContext context, ScrollController _) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 228, 228),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Column(
            children: [
              // เพิ่มหัวข้อที่ต้องการก่อน ListView.builder
              Padding(
                padding: const EdgeInsets.all(16.0), // กำหนด padding ให้หัวข้อ
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // จัดตำแหน่งซ้าย-ขวา
                  children: [
                    const Text(
                      'รายการล่าสุด', // ข้อความด้านซ้าย
                      style: TextStyle(
                        fontSize: 18.0, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ความหนาของตัวอักษร
                        color: Colors.black, // สีของข้อความ
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // เพิ่มการทำงานเมื่อกด 'ดูทั้งหมด' (ถ้ามี)
                      },
                      child: const Text(
                        'ดูทั้งหมด', // ข้อความด้านขวา
                        style: TextStyle(
                          fontSize: 16.0, // ขนาดตัวอักษร
                          fontWeight: FontWeight.bold, // ความหนาของตัวอักษร
                          color:
                              Color.fromARGB(255, 255, 102, 0), // สีของข้อความ
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller:
                      scrollController, // ใช้ scrollController ที่ส่งมาจาก HomeWidget
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return _buildTransactionItem(
                      icon: FontAwesomeIcons.moneyCheckAlt,
                      iconColor: Colors.orange,
                      title: 'Transfer (aspire->Mr.x)',
                      date: '15 ส.ค., 9:00',
                      amount: index % 2 == 0 ? '-\$200' : '+\$150',
                      amountColor: index % 2 == 0 ? Colors.red : Colors.green,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String date,
    required String amount,
    required Color amountColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: iconColor),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(date),
          trailing: Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: amountColor,
            ),
          ),
        ),
      ),
    );
  }
}
