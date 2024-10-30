import 'dart:async';
import 'package:appau2/pages/QR_code/QrReceive.dart';
import 'package:appau2/pages/Transition/Transition.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeWidget extends StatefulWidget {
  final String pageName;
  final DraggableScrollableController draggableScrollableController;
  final ScrollController scrollController;
  final Function(bool) onSheetCollapseChange;

  const HomeWidget(
    this.pageName, {
    super.key,
    required this.draggableScrollableController,
    required this.scrollController,
    required this.onSheetCollapseChange,
  });

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late double nestedScrollViewHeight;
  double nestedScrollViewOffset = 0.0;
  Timer? _dragEndTimer;
  double qrOpacity = 0.0;
  bool _isCollapsed = false; // สถานะการย่อของแผ่น
  bool _isAnimating = false; // สถานะของการเปลี่ยนแปลงความโปร่งใส

  static const minSize = 0.2;
  static const maxSize = 0.75;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        nestedScrollViewHeight = 250.0;
      });
    });

    widget.draggableScrollableController.addListener(_draggableSheetListener);
  }

  void _draggableSheetListener() {
    final draggableSize = widget.draggableScrollableController.size;
    final progress = (draggableSize - minSize) / (maxSize - minSize);

    if (mounted) {
      Future.microtask(() {
        setState(() {
          nestedScrollViewOffset = -nestedScrollViewHeight * (1.0 - progress);
          qrOpacity = 1 - progress;

          if (!_isCollapsed && progress <= 0.5) {
            _startCollapseAnimation();
          } else if (_isCollapsed && progress > 0.5) {
            _expandSheet();
          }
        });
      });

      _dragEndTimer?.cancel();
      _dragEndTimer = Timer(const Duration(milliseconds: 100), () {
        if (widget.draggableScrollableController.size != maxSize &&
            widget.draggableScrollableController.size != minSize) {
          if (_isCollapsed) {
            _startCollapseAnimation();
          } else {
            _expandSheet();
          }
        }
      });
    }
  }

  void _startCollapseAnimation() {
    setState(() {
      _isAnimating = true;
    });

    widget.draggableScrollableController
        .animateTo(
      minSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    )
        .then((_) {
      setState(() {
        _isCollapsed = true;
        _isAnimating = false;
      });
      widget.onSheetCollapseChange(true);
    });
  }

  void _expandSheet() {
    setState(() {
      _isCollapsed = false;
      _isAnimating = false;
    });
    widget.onSheetCollapseChange(false);

    widget.draggableScrollableController.animateTo(
      maxSize,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  // เพิ่มฟังก์ชันสำหรับการสลับระหว่างขยายและย่อ
  void _toggleSheet() {
    if (_isCollapsed) {
      _expandSheet();
    } else {
      _startCollapseAnimation();
    }
  }

  @override
  void dispose() {
    _dragEndTimer?.cancel();
    widget.draggableScrollableController
        .removeListener(_draggableSheetListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nestedScrollViewHeight = 340.0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: qrOpacity,
              child: const QrReceivePage(), // หน้ารับ QR โค้ด
            ),
          ),
        Transform.translate(
  offset: Offset(0, nestedScrollViewOffset),
  child: NestedScrollView(
    controller: widget.scrollController,
    // ใช้เงื่อนไขเพื่อควบคุมการเลื่อน NestedScrollView
    physics: widget.draggableScrollableController.isAttached &&
            widget.draggableScrollableController.size != minSize &&
            widget.draggableScrollableController.size != maxSize
        ? const ClampingScrollPhysics() // เลื่อนได้เฉพาะเมื่อ DraggableScrollableSheet ขยับ
        : const NeverScrollableScrollPhysics(), // ล็อกการเลื่อนเมื่อแผ่นไม่ขยับ
    headerSliverBuilder: (context, innerBoxIsScrolled) => [
      SliverToBoxAdapter(
        child: Stack(
          children: [
            // ClipPath เพื่อสร้างว้าวตรงกลางเป็นรูปกรวยยาว
            ClipPath(
              clipper: BottomHalfCircleClipper(),
              child: Container(
                height: nestedScrollViewHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFFFC5B20),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 40.0, 24.0, 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: 53.0,
                                height: 53.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 247, 245, 245),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      'https://picsum.photos/seed/810/600',
                                      width: 37.0,
                                      height: 37.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome,',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontFamily: 'Readex Pro',
                                              color: const Color.fromARGB(
                                                  255, 250, 249, 248),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'User',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontFamily: 'Readex Pro',
                                              color: const Color.fromARGB(
                                                  255, 248, 247, 246),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFC5B20),
                                    ),
                                    alignment:
                                        const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 5.0, 0.0),
                                      child: IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.bell,
                                          color: Color.fromARGB(
                                              255, 248, 246, 248),
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 18.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD83D17),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'ยอดเงินคงเหลือ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: 'Readex Pro',
                                                color: const Color(0xFFFED0A5),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          '\$ 125,400.55',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: 'Readex Pro',
                                                color: const Color.fromARGB(
                                                    255, 255, 254, 254),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 12.0, 0.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF780607),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.coins,
                                              color: Color(0xFFFFA726),
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '1,234',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontFamily: 'Readex Pro',
                                                    color: const Color.fromARGB(
                                                        255, 255, 254, 254),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 18.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEEAD2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: Color.fromARGB(255, 12, 12, 12),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Topup',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily:
                                                'Readex Pro', // กำหนดฟอนต์ที่คุณต้องการ
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFFEEAD2), // กำหนดสีพื้นหลังตามต้องการ
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_outward,
                                        color: Color.fromARGB(255, 7, 7, 7),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Transfer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 252, 250, 249),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                   GestureDetector(
      onTap: _toggleSheet, 
       child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEEAD2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.input,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                   ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Receive',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily:
                                                'Readex Pro', // กำหนดฟอนต์ที่คุณต้องการ
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                       Column(
  mainAxisSize: MainAxisSize.max,
  children: [
    GestureDetector(
      onTap: _toggleSheet, // เพิ่ม onTap ให้เรียก _toggleSheet
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFEEAD2),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: FaIcon(
            FontAwesomeIcons.qrcode,
            color: Color.fromARGB(255, 2, 2, 2),
            size: 24.0,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Text(
        'Scan',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'Readex Pro', // กำหนดฟอนต์ที่คุณต้องการ
              color: const Color.fromARGB(255, 253, 253, 253),
              letterSpacing: 0.0,
            ),
      ),
    ),
  ],
),



                              
                            ],
                            
                          ),
                          
                        ),
               
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    ],
    body: Container(), // เนื้อหาภายใน NestedScrollView
  ),
),
          // เพิ่ม AnimatedOpacity ให้ไอคอนลูกศรค่อยๆจางหายไป
          Positioned(
            top: 300, // ปรับตำแหน่งของปุ่ม
            left: MediaQuery.of(context).size.width / 2 - 15, // กึ่งกลางหน้าจอ
            child: AnimatedOpacity(
              opacity: _isAnimating || _isCollapsed
                  ? 0.0
                  : 1.0, // ค่อยๆจางหายเมื่อย่อ
              duration: const Duration(
                  milliseconds: 300), // ระยะเวลาที่ใช้ในการเปลี่ยนความโปร่งใส
              child: GestureDetector(
                onTap: _toggleSheet, // เมื่อกดปุ่ม จะทำการขยายหรือย่อแผ่น
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent, // ตั้งค่าพื้นหลังให้โปร่งใส
                    boxShadow: [],
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down, // ไอคอนลูกศรลง
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),

          // ใช้ Visibility เพื่อควบคุมการแสดงผล DraggableScrollableSheet
          AnimatedSlide(
            offset: _isCollapsed
                ? const Offset(0, 1)
                : const Offset(0, 0), // เลื่อนออกเมื่อย่อ
            duration: const Duration(milliseconds: 300),
            child: DraggableScrollableSheet(
              controller: widget.draggableScrollableController,
              initialChildSize: 0.75,
              minChildSize: minSize,
              maxChildSize: maxSize,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return TransitionPage('').buildDraggableSheet(
                  scrollController: scrollController,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// CustomClipper ที่ใช้สร้างว้าวด้านล่างเป็นครึ่งวงกลม
class BottomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // กำหนดรัศมีของมุมโค้งแต่ละด้าน
    double leftCornerRadius = 42.0;
    double rightCornerRadius = 46.0;

    // กำหนดขนาดและตำแหน่งของไอคอน
    double iconSize = 30.0;
    double iconPositionX = size.width / 2;

    // กำหนดรัศมีของครึ่งวงกลม
    double circleRadius = iconSize / 2 + 10.0;

    // คำนวณตำแหน่งจุดศูนย์กลางของครึ่งวงกลม
    double circleCenterX = iconPositionX;
    double circleCenterY = size.height - circleRadius - (-5);

    // เริ่มต้นจากมุมบนซ้ายด้วยมุมโค้งซ้าย
    path.moveTo(0, leftCornerRadius);
    path.quadraticBezierTo(0, 0, leftCornerRadius, 0);

    // วาดเส้นตรงไปยังมุมบนขวาพร้อมมุมโค้งขวา
    path.lineTo(size.width - rightCornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, rightCornerRadius);

    // วาดเส้นตรงลงไปยังมุมล่างขวาพร้อมมุมโค้งขวา
    path.lineTo(size.width, size.height - 20 - rightCornerRadius);
    path.quadraticBezierTo(size.width, size.height - 20,
        size.width - rightCornerRadius, size.height - 20);

    // วาดเส้นตรงไปยังจุดเริ่มต้นของครึ่งวงกลมทางด้านขวา
    path.lineTo(circleCenterX + circleRadius, size.height - 20);

    // **สร้างช่องว่างของครึ่งวงกลม**
    // วาดเส้นโค้งทวนเข็มนาฬิกาเพื่อเว้นช่องว่าง
    path.arcToPoint(
      Offset(circleCenterX - circleRadius, size.height - 20),
      radius: Radius.circular(circleRadius),
      clockwise: false,
    );

    // วาดเส้นตรงจากปลายครึ่งวงกลมไปยังมุมล่างซ้ายพร้อมมุมโค้งซ้าย
    path.lineTo(leftCornerRadius, size.height - 20);
    path.quadraticBezierTo(
        0, size.height - 20, 0, size.height - 20 - leftCornerRadius);

    // ปิดเส้นทาง
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
