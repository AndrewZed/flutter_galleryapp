import 'package:flutter/material.dart';
import 'package:flutter_galleryapp/widgets/widgets.dart';
import 'package:flutter_galleryapp/res/res.dart';

const String kFlutterDash =
    'https://storage.googleapis.com/cms-storage-bucket/65361d7e1dfa118aa63b.png';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: <Widget>[
              _buildItem(),
              const Divider(thickness: 2, color: AppColors.mercury),
            ]);
          }),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(photoLink: kFlutterDash),
        _buildPhotoMeta(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'This is Flutter dash. I love him.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.black),
          ),
        )
      ],
    );
  }

  Widget _buildPhotoMeta() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const UserAvatar(
                  avatarLink:
                      'https://e7.pngegg.com/pngimages/595/79/png-clipart-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna.png'),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Andrey Bolshakov', style: AppStyles.h2Black),
                  Text('@AndrewZed',
                      style:
                          AppStyles.h5Black.copyWith(color: AppColors.manatee))
                ],
              )
            ],
          ),
          LikeButton(10, true),
        ],
      ),
    );
  }
}
