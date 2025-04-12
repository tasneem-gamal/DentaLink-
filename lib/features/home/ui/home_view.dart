import 'package:dentalink/features/AI_scan/ui/widgets/ai_scan_view.dart';
import 'package:dentalink/features/cart/ui/cart_view.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/home_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/app_bottom_navigation_bar.dart';
import 'package:dentalink/features/home/ui/widgets/side_menu/app_side_menu.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/home_floating_action_button.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/home_view_body.dart';
import 'package:dentalink/features/profile/profile_view.dart';
import 'package:dentalink/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:dentalink/features/shop/ui/shop_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.patientData});

  final List<PatientData> patientData;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;

  List<Widget> appViews = const [
      HomeViewBody(),
      ShopView(),
      AiScanView(),
      CartView(),
      ProfileView(),
    ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: selectedIndex == 4 ? ProfileAppBar(scaffoldKey: scaffoldKey) : HomeAppBar(scaffoldKey: scaffoldKey),
      drawer: const AppSideMenu(),
      body: SafeArea(child: appViews[selectedIndex]),
      floatingActionButton: selectedIndex == 0 ? const HomeFloatingActionButton() : null,
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}











