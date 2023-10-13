import 'package:flutter/material.dart';
import 'package:flutter_galleryapp/res/res.dart';
import '../widgets/widgets.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage(
      {Key? key,
      required this.userFoto,
      required this.name,
      required this.nickName,
      required this.altDescription,
      required this.foto})
      : super(key: key);

  final String foto;
  final String userFoto;
  final String name;
  final String nickName;
  final String altDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Photo(photoLink: foto),
          SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              altDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3.copyWith(color: AppColors.black),
            ),
          ),
          SizedBox(height: 14),
          _buildPhotoMeta(userFoto, name, nickName),
          SizedBox(height: 17),
          _buildActionButtons(),
        ],
      ),
    );
  }
}

Widget _buildActionButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LikeButton(2345, true),
        SizedBox(width: 13),
        Expanded(child: _buildButton('Save')),
        SizedBox(width: 12),
        Expanded(child: _buildButton('Visit')),
      ],
    ),
  );
}

Widget _buildButton(String name) {
  return TextButton(
    onPressed: () {},
    child: Text(name, style: AppStyles.h4.copyWith(color: Colors.black)),
    style: ButtonStyle(foregroundColor: AppColors.dodgerBlue),
  );

  //GestureDetector(
  //  behavior: HitTestBehavior.opaque,
  // onTap: () {},
  // child: Container(
  //  alignment: Alignment.center,
  //   height: 36,
  //   decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(7), color: AppColors.dodgerBlue),
  //    child: Text(name, style: AppStyles.h4.copyWith(color: Colors.white)),
  //  ),
}

AppBar _buildAppBar(context) {
  return AppBar(
    title: Text('Photo', style: AppStyles.h2Black),
    centerTitle: true,
    forceMaterialTransparency: true,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

Widget _buildPhotoMeta(String userFoto, String name, String nickName) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            UserAvatar(avatarLink: userFoto),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name, style: AppStyles.h1Black),
                Text(nickName,
                    style: AppStyles.h5Black.copyWith(color: AppColors.manatee))
              ],
            )
          ],
        ),
      ],
    ),
  );
}
