import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';

class CustomCashedImage extends StatelessWidget {
  final String image;
  final BoxShape shape;
  final double width;
  final double height;

  const CustomCashedImage({
    super.key,
    required this.image,
    this.width = 100.0,
    this.height = 100.0,
    this.shape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
        width: 100.0,
        height: 100.0,
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
      errorWidget: (context, url, error) => SizedBox(
        width: 100.0,
        height: 100.0,
        child: Image.asset(
          Strings.personProfile,
          width: 50,
          height: 50,
          fit: BoxFit.none,
          color: Colors.white,
        ),
      ),
    );
  }
}
