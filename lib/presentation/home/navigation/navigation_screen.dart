import 'package:flutter/material.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_screen.dart';
import 'package:frontend_geolocation/presentation/home/profile/profile_screen.dart';

import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late NavigationProvider _provider;
  // final PageController _pageController = PageController();
  final List<Widget> _pages = const [LandingScreen(), ProfileScreen()];

  @override
  void initState() {
    super.initState();
    _provider = NavigationProvider();
  }

  // void initializePage(int index) {
  //   if (_pages[index] is StatefulElement) {
  //     final StatefulElement element = _pages[index] as StatefulElement;
  //     final State state = element.state;
  //     if (state is StatefulWidget) {
  //       state.initState();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _provider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final state = provider.state;

    return Scaffold(
      body: IndexedStack(index: state.active, children: _pages),
      // body: PageView(
      //   controller: _pageController,
      //   children: _pages,
      //   onPageChanged: (index) {
      //     _provider.changeActiveMenu(index);
      //     initializePage(index); // Initialize the page's data
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _provider.changeActiveMenu(value);
          // _pageController.jumpToPage(value);
        },
        currentIndex: state.active,
        // selectedLabelStyle: textExtraSmallSemiBold,
        // unselectedLabelStyle: textExtraSmallSemiBold,
        unselectedItemColor: AppColor.primaryText,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Icon(Icons.people),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
