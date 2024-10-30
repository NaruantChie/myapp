import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../flutter_flow/nav/nav.dart';
import '/pages/home/home_widget.dart';
import '/pages/account/account_widget.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget(
    String s, {
    Key? key,
    required this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  bool _isNavigating = false;
  late Widget currentWidget;
  String selectedPage = 'home';

  final ScrollController scrollController = ScrollController();
  final DraggableScrollableController draggableScrollableController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    currentWidget = HomeWidget(
      '',
      draggableScrollableController: draggableScrollableController,
      scrollController: scrollController,
      onSheetCollapseChange: _handleSheetCollapseChange,
    );
  }

  void _navigateToPage(String pageName) {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
      selectedPage = pageName;

      if (pageName == 'home') {
        currentWidget = HomeWidget(
          '',
          draggableScrollableController: draggableScrollableController,
          scrollController: scrollController,
          onSheetCollapseChange: _handleSheetCollapseChange,
        );
      } else if (pageName == 'account') {
        currentWidget = const AccountWidget();
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isNavigating = false;
      });
    });
  }

  void _handleSheetCollapseChange(bool isCollapsed) {
    Provider.of<CollapseStateNotifier>(context, listen: false)
        .setCollapsed(isCollapsed);
  }

  @override
  Widget build(BuildContext context) {
    final collapseNotifier = Provider.of<CollapseStateNotifier>(context);

    return Scaffold(
      body: Stack(
        children: [
          currentWidget,
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: collapseNotifier.isCollapsed
              ? GestureDetector(
                  onTap: () {
                    draggableScrollableController.animateTo(
                      0.85,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    alignment: Alignment.center,
                    height: 50.0,
                    child: const Text(
                      'กลับหน้าหลัก',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 204, 204, 204),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 80.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/11798727_4857390.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconWithLabel(
                              icon: Icons.home,
                              label: 'home',
                              text: 'Home',
                            ),
                            _buildIconWithLabel(
                              icon: Icons.access_time,
                              label: 'history',
                              text: 'History',
                            ),
                            _buildIconWithLabel(
                              icon: FontAwesomeIcons.wallet,
                              label: 'wallet',
                              text: 'Wallet',
                            ),
                            _buildIconWithLabel(
                              icon: Icons.account_circle,
                              label: 'account',
                              text: 'Account',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildIconWithLabel({
    required IconData icon,
    required String label,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        if (!_isNavigating && selectedPage != label) {
          _navigateToPage(label);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                selectedPage == label ? const Color(0xFFFC5B20) : Colors.grey,
            size: 24.0,
          ),
          Text(
            text,
            style: TextStyle(
              color:
                  selectedPage == label ? const Color(0xFFFC5B20) : Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
