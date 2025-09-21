import 'package:flutter/material.dart';

class BannerGridWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const BannerGridWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final list = data?['banners'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              list[index]['image'] ?? "",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        );
      },
    );
  }
}
