import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const CarouselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List list = data?["carousel_items"];
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
      items: list.map((item) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item["image"],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 100,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
