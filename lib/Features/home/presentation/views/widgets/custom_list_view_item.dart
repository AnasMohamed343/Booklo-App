import 'package:booklo/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    // return AspectRatio(
    //   aspectRatio: 2.7 / 4,
    //   child: Container(
    //     decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(25)),
    //         image: DecorationImage(
    //           fit: BoxFit.fill,
    //           image: AssetImage(
    //             AssetsData.bookImageTest,
    //           ),
    //         )),
    //   ),
    // );
    return ClipRRect(
      //to make borderRadius rounded
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(
              child:
                  CircularProgressIndicator()), //or take the image loaded with fading
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
