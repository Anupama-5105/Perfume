import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_tdd_app/ui/common/app_images.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final Widget? errorWidget;
  final double? height;
  const NetworkImageWidget({
    super.key,
    required this.url,
    this.errorWidget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      height: height,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
          errorWidget ?? Image.asset(spreyIcon),
    );
  }
}
