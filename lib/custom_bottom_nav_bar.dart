
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final BuildContext parentContext;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.parentContext,
  });

  final List<Map<String, String>> _navItems = const [
    {'icon': 'assets/home.png', 'label': 'Home'},
    {'icon': 'assets/user-tag.png', 'label': 'Add inquiry'},
    {'icon': 'assets/user-cirlce-add.png', 'label': 'Admission'},
    {'icon': 'assets/user-square.png', 'label': 'Profile'},
  ];

  void _navigate(int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushNamed(parentContext, '/HomePage');
        break;
      case 1:
        Navigator.pushNamed(parentContext, '/AddInquiry');
        break;
      case 2:
        Navigator.pushNamed(parentContext, '/newAdmission');
        break;
      case 3:
        Navigator.pushNamed(
          parentContext,
          '/profile',
          arguments: {'openDrawer': true},
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _navigate,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      backgroundColor: Colors.white,
      elevation: 10,
      items: List.generate(_navItems.length, (index) {
        final isSelected = index == selectedIndex;
        return BottomNavigationBarItem(
          icon: Container(
            height: 81,
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(216, 0, 39, 1)
                  : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _navItems[index]['icon']!,
                  width: 28,
                  height: 28,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                const SizedBox(height: 4),
                Text(
                  _navItems[index]['label']!,
                  overflow: TextOverflow.visible,
                  softWrap: false,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : const Color.fromRGBO(24, 24, 24, 1),
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          label: '',
        );
      }),
    );
  }
}
