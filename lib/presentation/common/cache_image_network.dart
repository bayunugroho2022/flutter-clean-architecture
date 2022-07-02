import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/presentation/resources/asset_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getCacheImageNetwork({String? image, double height = 100, double width = 100}) {
  return CachedNetworkImage(
    imageUrl: image!,
    fit: BoxFit.cover,
    width: double.infinity,
    progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        width: width,
        height: height,
        child: Center(
            child: SizedBox(
          height: AppSize.s100,
          width: AppSize.s100,
          child: Lottie.asset(JsonAssets.loading),
        ))),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
