import 'package:flutter/material.dart';
import 'package:train_ticket_buying_app/core.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../controller/main_navigation_controller.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            DashboardView(),
            BookingDetailView(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: (newIndex) => controller.updateIndex(newIndex),
              showSelectedLabels: false,
              elevation: 0.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 36.0,
                  ),
                  label: "Dasbor",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 36.0,
                  ),
                  label: "Pesanan",
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
