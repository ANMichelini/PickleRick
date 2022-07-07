import 'package:flutter/material.dart';
import 'package:new_app/features/home/widgets/selected_text_style.dart';
import 'package:new_app/features/home/widgets/text_widget.dart';
import 'package:new_app/helpers/scroll_behaviour.dart';
import 'package:new_app/provider/provider.dart';
import 'package:provider/provider.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

final PageController pageController = PageController();
final ScrollController scrollController = ScrollController();

class _InfoWidgetState extends State<InfoWidget> {
  @override
  void initState() {
    pageController.addListener(() {});
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textList = <String>[
      'About',
      'Info',
      'Cast',
      'Critic',
    ];
    final appProv = Provider.of<AppProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 5),
                itemCount: 4,
                controller: scrollController,
                itemBuilder: (context, int index) {
                  return HeadlineButton(
                    text: textList[index],
                    pageController: pageController,
                    index: index,
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: PageView(
                padEnds: false,
                controller: pageController,
                onPageChanged: (int index) {
                  appProv.currentPage = index.toDouble();
                  appProv.selectedButton = index;
                  scrollController.animateTo(index.toDouble(),
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                },
                children: [
                  SelectedTextStyle(
                    'Rick and Morty is an American adult animated television series created by Justin Roiland and Dan Harmon in 2013 for Adult Swim. The series follows the misadventures of a scientist, Rick, and his easily influenced grandson, Morty, who spend their time between domestic life and space, time, and intergalactic travel.',
                  ),
                  SelectedTextStyle(
                    'The series originated from a rudimentary short film animated by Roiland for the Channel 101 film festival called Doc and Mharti, a parody of the main leads from Back to the Future. When NBC fired Harmon in 2013 over arguments between him and executives from the series he had created, Community, he and Roiland developed a series based on the characters Roiland had already created.',
                  ),
                  SelectedTextStyle(
                    'Rick Sanchez (Justin Roiland), Morty Smith (Justin Roiland), Jerry Smith (Chris Parnell), Summer Smith (Sarah Chalke).',
                  ),
                  SelectedTextStyle(
                    'Rick and Morty has received general critical acclaim, with an approval rating of 97% on the specialized website Rotten Tomatoes. In addition, on the Metacritic website the first season has a score of 85 out of 100. David Weigan of the San Francisco Chronicle describes the series as "offbeat and occasionally gritty...which makes it tick." He also praises the animation direction, by James McDermott, for being "fresh, colorful and as wacky as the script"; and states that the series has "shades of Futurama, South Park and even Beetlejuice", finally opining that its humor is "totally original". ',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
