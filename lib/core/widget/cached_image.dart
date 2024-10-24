import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CachedImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return url == null || url == ''
        ? Container(color: AppColor.greyLight, width: width, height: height)
        : CachedNetworkImage(
            imageUrl: url!,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
