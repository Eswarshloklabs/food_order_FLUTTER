import 'package:flutter/material.dart';
import 'package:myflutter/colors.dart';

class drawermenu extends StatelessWidget {
  const drawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/face.png"),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text("your name"),
                accountEmail: Text("yourmail@gmail.com"),
              ),
              menulist(title: "Orders", iconName: Icons.border_color),
              menulist(title: "Address", iconName: Icons.bookmark),
              menulist(title: "Notification", iconName: Icons.notifications),
              menulist(title: "About", iconName: Icons.help),
              menulist(title: "Help", iconName: Icons.account_box),
              menulist(title: "Rate Us", iconName: Icons.star_half),
              menulist(
                title: "Log Out",
                iconName: Icons.exit_to_app,
              ),
            ],
          ),
        ));
  }
}

class menulist extends StatelessWidget {
  final String title;
  final IconData iconName;

  const menulist({
    required this.title,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconName as IconData?,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }
}
