import 'package:flutter/material.dart';

class StudioAppbar extends StatelessWidget {
  const StudioAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/youtube.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Studio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.yellow,
            backgroundImage: AssetImage("assets/noboman.jpg"),
            radius: 14,
          )
        ],
      ),
    );
  }
}
