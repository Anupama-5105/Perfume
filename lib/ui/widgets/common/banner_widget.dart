import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const BannerWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          data?['banner']['image'] ?? "",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}
