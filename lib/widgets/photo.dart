import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galleryapp/res/colors.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key, required this.photoLink}) : super(key: key);

  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(17)),
        child: Container(
          color: AppColors.grayChateau,
          child: CachedNetworkImage(
            imageUrl: photoLink,
            fit: BoxFit.fill,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
