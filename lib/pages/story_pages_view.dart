import 'package:combi/utils/shop.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
     
      StoryItem.inlineImage(
        url:
            "https://www.sciencesetavenir.fr/assets/img/2014/02/05/cover-r4x3w1200-57df57ac91870-le-hamburger-un-bon-choix-pour-la-pause-dejeuner.jpg",
        controller: controller,
      ),
      StoryItem.text(
        title:
            "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
        backgroundColor: Colors.orange,
        roundedTop: true,
      ),
      StoryItem.text(
        title:
            "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
        backgroundColor: Colors.blue,
        roundedTop: true,
      ),
      // Décommentez et ajustez les autres items selon vos besoins
    ];

    return Scaffold(
      body: Material(
        child: StoryView(
          storyItems: storyItems,
          controller: controller,
          onComplete: () {
            print("Completed a cycle");
          },
          onStoryShow: (value) => print("Showing a story"),
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Navigator.pop(context);
            }
          },
          inline: false,
          repeat: false,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(12),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          // ),
          child: Container(
            // color: Colors.white.withOpacity(0.4),
            color: Colors.white,
            height: 100,
            child: Shop(
                exerciceName: "Hamburger",
                numberOfExercices: 2,
                color: Colors.blue,
                icon: Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
