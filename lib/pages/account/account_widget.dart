import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';





class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  get items => [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromARGB(
            255, 241, 244, 248), // 255 คือค่า alpha สูงสุด (ไม่โปร่งใส)

        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFC5B20),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                border: Border.all(
                  color: const Color(0xFFFC5B20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 53.0,
                            height: 53.0,
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[100], // แทนที่ด้วยสีที่คุณต้องการ
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                                topRight: Radius.circular(18.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  fadeInDuration:
                                      const Duration(milliseconds: 500),
                                  fadeOutDuration:
                                      const Duration(milliseconds: 500),
                                  imageUrl:
                                      'https://picsum.photos/seed/641/600',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pratak',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize:
                                        16.0, // แทนที่ด้วยขนาดฟอนต์ที่คุณต้องการ
                                    fontWeight: FontWeight
                                        .bold, // แทนที่ด้วยน้ำหนักฟอนต์ที่คุณต้องการ
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                Text(
                                  'pratak@gmail.com',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize:
                                        14.0, // กำหนดขนาดฟอนต์ที่คุณต้องการ
                                    fontWeight: FontWeight
                                        .normal, // กำหนดน้ำหนักฟอนต์ที่คุณต้องการ
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEAF79),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Complete your profile',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color.fromARGB(255, 253, 253, 253),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                    child: LinearPercentIndicator(
                                      percent: 0.33,
                                      width: 220.0,
                                      lineHeight: 11.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: const Color.fromARGB(
                                          255,
                                          255,
                                          254,
                                          254), // แทนที่ด้วยสีที่คุณต้องการ
                                      backgroundColor: const Color.fromARGB(
                                          255, 238, 139, 96),
                                      barRadius: const Radius.circular(12.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  const Text(
                                    '(1/3) validate email',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color.fromARGB(255, 255, 255,
                                          255), // แทนที่ด้วยสีที่คุณต้องการ
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ],
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
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 0.0, 16.0),
                      child: Text(
                        'Reward',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0, // หรือขนาดฟอนต์ที่คุณต้องการ
                          fontWeight:
                              FontWeight.bold, // หรือน้ำหนักฟอนต์ที่คุณต้องการ
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.coins,
                          color: Color(0xFFFC5B20),
                        ),
                        title: Text(
                          'My Coin',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Color.fromARGB(255, 255, 255,255), // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.tag,
                          color: Color(0xFFFC5B20),
                        ),
                        title: Text(
                          'My Reward',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.gift,
                          color: Color(0xFFFC5B20),
                        ),
                        title: Text(
                          'Invite Friend',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 0.0, 16.0),
                      child: Text(
                        'Setting',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0, // หรือขนาดฟอนต์ที่คุณต้องการ
                          fontWeight:
                              FontWeight.bold, // หรือน้ำหนักฟอนต์ที่คุณต้องการ
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: ListTile(
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight
                                .bold, // หรือปรับตามน้ำหนักฟอนต์ที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: const Text(
                          'Language',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),












Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
  child: ListTile(
    title: const Text(
      'Verify your identity',
      style: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 20.0,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
      ),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.grey,
      size: 20.0,
    ),
    tileColor: Colors.white,
    dense: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
onTap: () async {
  const url = 'https://flutterflow.io/';
  await launchUrl(Uri.parse(url));
},

  ),
),








                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: const Text(
                          'Notification',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight
                                .bold, // หรือปรับน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: Text(
                          'Security',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือปรับน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 0.0, 16.0),
                      child: Text(
                        'General Info',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0, // หรือขนาดฟอนต์ที่คุณต้องการ
                          fontWeight:
                              FontWeight.bold, // หรือน้ำหนักฟอนต์ที่คุณต้องการ
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: Text(
                          'Help Center',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: const Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 3.0, 24.0, 0.0),
                      child: ListTile(
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 24.0),
                      child: ListTile(
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20.0,
                            fontWeight: FontWeight
                                .bold, // หรือกำหนดน้ำหนักฟอนต์ตามที่คุณต้องการ
                            letterSpacing: 0.0,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.exit_to_app,
                          color: Colors
                              .grey, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryText
                          size: 20.0,
                        ),
                        tileColor: Colors
                            .white, // แทนที่ด้วยสีที่คุณต้องการแทน secondaryBackground
                        dense: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
  

                  ],
                ),
              ),
            ),


  

          ],


          
        ),

        
      ),
      
    );
    
  }
}
