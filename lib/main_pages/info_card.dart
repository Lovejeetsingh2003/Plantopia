import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class InfoCard extends StatefulWidget {
  final name, email;
  const InfoCard({super.key, required this.name, required this.email});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: kMainTextColor,
          child: Icon(
            Icons.person,
            color: kPrimaryColor,
            size: 25,
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
              fontSize: 20, color: kMainTextColor, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          widget.email,
          style: const TextStyle(
              fontSize: 15, color: kMainTextColor, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
