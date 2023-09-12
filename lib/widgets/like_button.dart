import 'package:flutter/material.dart';
import 'package:flutter_galleryapp/res/app_icons.dart';

class LikeButton extends StatefulWidget {
  LikeButton(this.likeCount, this.isLiked, {Key? key}) : super(key: key);
  final bool isLiked;
  final int likeCount;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          isLiked = !isLiked;
          if (isLiked) {
            likeCount++;
          } else {
            likeCount--;
          }
        });
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              const SizedBox(width: 4.21),
              Text(likeCount.toString())
            ],
          ),
        ),
      ),
    );
  }
}
