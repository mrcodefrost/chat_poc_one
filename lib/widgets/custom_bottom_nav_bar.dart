import 'package:chat_poc_one/screens/contacts_screen.dart';
import 'package:chat_poc_one/theme.dart';
import 'package:chat_poc_one/widgets/glowing_action_button.dart';
import 'package:flutter/material.dart';

class CustomBottonNavBar extends StatefulWidget {
  const CustomBottonNavBar({super.key, required this.onItemSelected});

  final ValueChanged<int> onItemSelected;

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  int selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(
                  label: 'Messages',
                  icon: Icons.message,
                  index: 0,
                  onTap: handleItemSelected,
                  isSelected: (selectedIndex == 0),
                ),
                _NavBarItem(
                  label: 'Notifications',
                  icon: Icons.notifications,
                  index: 1,
                  onTap: handleItemSelected,
                  isSelected: (selectedIndex == 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GlowingActionButton(
                      color: AppColors.secondary,
                      icon: Icons.add,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const Dialog(
                            child: AspectRatio(
                              aspectRatio: 8 / 7,
                              child: ContactsScreen(),
                            ),
                          ),
                        );
                      }),
                ),
                _NavBarItem(
                  label: 'Calls',
                  icon: Icons.call,
                  index: 2,
                  onTap: handleItemSelected,
                  isSelected: (selectedIndex == 2),
                ),
                _NavBarItem(
                  label: 'Contacts',
                  icon: Icons.contacts,
                  index: 3,
                  onTap: handleItemSelected,
                  isSelected: (selectedIndex == 3),
                ),
              ],
            ),
          )),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  });

  final String label;
  final IconData icon;
  final int index;
  final ValueChanged<int> onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to catch hits outside the elements in free space
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(label,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      )
                    : const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
