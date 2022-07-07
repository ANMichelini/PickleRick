import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> cardSwiperImages = [
      'assets/rickymortyimage1.jpg',
      'assets/rickymortyimage2.jpg',
      'assets/rickymortyimage3.jpg',
      'assets/rickymortyimage4.jpg',
      'assets/rickymortyimage5.jpg',
      'assets/rickymortyimage6.jpg',
      'assets/rickymortyimage7.jpg',
    ];
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: size.width * 1.0,
      height: size.height * 0.25,
      child: Swiper(
        autoplayDisableOnInteraction: true,
        autoplayDelay: 20000,
        autoplay: true,
        itemCount: 7,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 1.0,
        itemBuilder: (_, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(cardSwiperImages[index]),
              fit: BoxFit.cover,
              width: size.width * 1.0,
              height: size.height * 0.3,
            ),
          );
        },
      ),
    );
  }
}
