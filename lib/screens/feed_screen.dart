import 'package:flutter/material.dart';
import 'package:flutter_galleryapp/screens/foto_screen.dart';
import 'package:flutter_galleryapp/widgets/widgets.dart';
import 'package:flutter_galleryapp/res/res.dart';

const String kFlutterDash =
    'https://sun6-23.userapi.com/s/v1/if1/cI7V1bg7gn73P2yHNuMvy9GXXBYGwg_ctn_XC1BfiUIUqorNF7n0J0Qn0pV0yKg8Plzgelh5.jpg?size=1199x1200&quality=96&crop=359,0,1199,1200&ava=1';
const String userFoto =
    'https://e7.pngegg.com/pngimages/595/79/png-clipart-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna.png';

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
        GestureDetector(
            child: Photo(photoLink: kFlutterDash),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                          foto: kFlutterDash,
                          name: 'Andrey Bolshakov',
                          nickName: '@AndrewZed',
                          userFoto: userFoto,
                          altDescription:
                              'Beautiful girl in a yellow dress with a flower on her head in the summer in the forest')),
                )),
        _buildPhotoMeta(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Beautiful girl in a yellow dress with a flower on her head in the summer in the forest',
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
              const UserAvatar(avatarLink: userFoto),
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
          LikeButton(2345, true),
        ],
      ),
    );
  }
}
