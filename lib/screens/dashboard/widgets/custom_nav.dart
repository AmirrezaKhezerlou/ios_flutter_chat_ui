import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool isSheetOpen = false;

  void _showNewChatSheet() async {
    setState(() => isSheetOpen = true);

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _buildBottomSheetContent(),
    );

    setState(() => isSheetOpen = false);
  }

  Widget _buildBottomSheetContent() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(CupertinoIcons.chat_bubble_text),
            title: const Text("New Chat"),
            subtitle: const Text("Send a message to your contact"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.person_add),
            title: const Text("New Contact"),
            subtitle: const Text("Add a contact to be able to send messages"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.group),
            title: const Text("New Community"),
            subtitle: const Text("Join the community around you"),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
     color: Theme.of(context).scaffoldBackgroundColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      elevation: 2,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: CupertinoIcons.house, label: "Home", index: 0),
            const SizedBox(width: 80),
            _buildNavItem(icon: CupertinoIcons.person, label: "Profile", index: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    final bool isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }


  Widget buildMiddleButton() {
    return FloatingActionButton(
      onPressed: _showNewChatSheet,
      backgroundColor: isSheetOpen ? Colors.grey[800] : Colors.black,
      child: const Icon(CupertinoIcons.plus_bubble, color: Colors.white),
    );
  }
}
