import 'package:flutter/material.dart';
import '../services/utils.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 75,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/app_icon.jpg"),
                  fit: BoxFit.contain),
            ),
          ),
          const Text(
            "Nepali Lyric App",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
            "opentechnepal@gmail.com",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    // Send Email on press function
    sendEmail() {
      String email = "opentechnepal@gmail.com";
      Utils.openEmail(toEmail: "$email", subject: "Email Via App", body: "");
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Songs Lists"),
          autofocus: true,
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.mail),
          title: const Text("Contact/ Request"),
          autofocus: true,
          onTap: () {
            sendEmail();
          },
        ),
        ListTile(
          leading: const Icon(Icons.star_outline_sharp),
          title: const Text("Rate App"),
          autofocus: true,
          onTap: () {},
        )
      ],
    );
  }
}
