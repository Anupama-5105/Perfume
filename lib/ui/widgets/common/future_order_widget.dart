import 'package:flutter/material.dart';
import 'package:stacked_tdd_app/ui/widgets/common/network_image.dart';

class FutureOrderWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const FutureOrderWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: NetworkImageWidget(url: data?['image'] ?? ""),
        ),
      ),
    );
  }
}
