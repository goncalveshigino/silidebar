import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoes_app/models/page_manager.dart';

class MenuItem extends StatelessWidget {
  MenuItem({this.icon, this.title, this.page, this.onTap});

  final IconData icon;
  final String title;
  final int page;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.cyan, size: 30),
            SizedBox(
              width: 20,
            ),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 26,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
