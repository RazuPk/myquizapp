import 'package:flutter/material.dart';
import '../../screens/login_screen.dart';

import '../utils/style.dart';


class AppBarProfileWidget extends StatelessWidget {
  const AppBarProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black54.withOpacity(0.6),
        child: const Icon(
          Icons.person,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Md.Razu Pk',
            style: subTitleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Text(
            'pkrazu112@gmail.com',
            style: subTitleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}