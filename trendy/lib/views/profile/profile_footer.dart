import 'package:flutter/material.dart';

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
          const Text('www.jessicasmith.com'),
          Switch(
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
