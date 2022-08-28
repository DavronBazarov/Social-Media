import 'package:flutter/material.dart';
import 'package:story/story_page_view/story_page_view.dart';

class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  final sampleUsers = [
    UserModel([
      StoryModel(
          "https://scontent.ftas1-1.fna.fbcdn.net/v/t39.30808-6/294631624_457447562868700_6898331695238542868_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=RKaem0fImxkAX-KF6R0&tn=SAe3oCT47hfgUlKU&_nc_ht=scontent.ftas1-1.fna&oh=00_AT-eKrau3exGbSR1wxUEA-_AkSnspiN6wTx96ZTiMzop9w&oe=62F53F27"),
      StoryModel(
          "https://scontent.ftas1-2.fna.fbcdn.net/v/t39.30808-6/293415746_450631956883594_8319870952268615065_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=k4ht7GPzo6EAX-7g5xG&_nc_ht=scontent.ftas1-2.fna&oh=00_AT_ggPeOJ_vP5EZyPLyDhIkkZLxI4km-sJy5M1Rq-CHqYQ&oe=62F36B16"),
      StoryModel(
          "https://scontent.ftas2-1.fna.fbcdn.net/v/t39.30808-6/261474774_312860520660739_7990297773491015061_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=e3f864&_nc_ohc=mJj7U41S6mgAX-4VU2E&tn=SAe3oCT47hfgUlKU&_nc_ht=scontent.ftas2-1.fna&oh=00_AT-ZqOrMgi7Y3BEni_KArKQdoIoqrhNxw4BoSJ2iWR3RBQ&oe=62F61499"),
    ], "Davron",
        "https://scontent.ftas2-1.fna.fbcdn.net/v/t39.30808-6/294706127_457446869535436_8747427663974438263_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=OE5IW6bUICwAX8xMcu6&tn=SAe3oCT47hfgUlKU&_nc_ht=scontent.ftas2-1.fna&oh=00_AT-NJvnuiTwWFa7XXpbaQp1WrepE_KAR19lANhCNqSzICw&oe=62F6064F"),
    UserModel([
      StoryModel(
          "https://scontent.ftas1-2.fna.fbcdn.net/v/t1.6435-9/113830986_2775529619439574_5996182323950400953_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=19026a&_nc_ohc=RJAmWVSyhacAX-EnLft&_nc_ht=scontent.ftas1-2.fna&oh=00_AT_7yyQxcnRC4-aUpSjPrqgRunUKzGrTlGcU0-QTprSnvg&oe=63144C61"),
    ], "Zayniddin",
        "https://i.mycdn.me/i?r=AyH4iRPQ2q0otWIFepML2LxRYYWJBpAaUJOPsDhHgz6F7g&dpr=2"),
    UserModel([
      StoryModel("https://aniq.uz/photos/5edf5af37b1c6.jpg"),
      StoryModel("https://aniq.uz/photos/5edf5af505a2e.jpg"),
      StoryModel("https://aniq.uz/photos/5edf5b99944ef.jpg"),
    ], "Durdona",
        "https://scontent.ftas1-2.fna.fbcdn.net/v/t1.6435-9/126300363_375770800162130_2633553777635410781_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=aKVdjTXX26sAX_jVQl6&_nc_ht=scontent.ftas1-2.fna&oh=00_AT8ZH_OxazReTpddEni0iM9PSLve-zSpnb6tpmlnNkApJw&oe=63167F58"),
  ];

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ]);
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 1;
          }
          return 0;
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
