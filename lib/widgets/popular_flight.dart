import 'package:flutter/material.dart';

class PopularFlightWidget extends StatelessWidget {
  const PopularFlightWidget({super.key, this.img, this.destination});
  final String? img;
  final String? destination;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 90,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.transparent, Colors.black54],
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(4),
              child: Center(
                child: Text(
                  destination.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ))
      ],
    );
  }
}
