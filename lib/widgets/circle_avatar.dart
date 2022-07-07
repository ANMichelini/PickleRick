import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  CircleAvatarWidget(
      {required this.radius, required this.image, this.text, this.onTap});
  final String image;
  final String? text;
  final void Function()? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: radius,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loadingmovie.gif'),
                      image: NetworkImage(image),
                      imageErrorBuilder: (context, object, stackTrace) => Image(
                        image: AssetImage('assets/no-image.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
