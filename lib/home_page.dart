import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/story_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var stories;
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Instagram",
                  style: TextStyle(fontFamily: "Billabong", fontSize: 32),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.message_outlined),
                      iconSize: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildStory("Davron", "davron.jpg"),
                buildStory("Zayniddin", "zaniddin.jpg"),
                buildStory("Durdona", "durdona.png"),
                buildStory("Dilshod", "dilshod.jpg"),
                buildStory("Rano", "rano.jpeg"),
                buildStory("Shavkat", "shavkat.png"),
                buildStory("Azizbek", "azizbek.jpg"),
              ],
            ),
          ),
          buildPostsFull(
            "Durdona",
            "durdona.png",
            "https://scontent.ftas2-1.fna.fbcdn.net/v/t1.6435-9/58462530_360979648098688_45323247981428736_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=9267fe&_nc_ohc=8M7LBTbh5uwAX8V6sJu&_nc_ht=scontent.ftas2-1.fna&oh=00_AT98P2QnGfg0B-050vws9fS8oC-DH2iDJjvOrbjsgr45lA&oe=6314B477",
            "6 min",
            "44",
            "3,215",
          ),
          buildPostsFull(
            "Zayniddin",
            "zaniddin.jpg",
            "https://i.mycdn.me/i?r=AyH4iRPQ2q0otWIFepML2LxRkUuaBDNnFSi5gy-Ni5zNmA&dpr=2",
            "1 year ago",
            "203",
            "500"
          ),
          buildPostsFull(
            "Dilshod",
            "dilshod.jpg",
            "https://i.mycdn.me/i?r=AyH4iRPQ2q0otWIFepML2LxRMP30niq6xmltN31tOJuNEA&dpr=2",
            "1 month",
            "129",
            "944",
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home_filled,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.add_box_outlined,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.notifications,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
              color: Colors.black,
            ),
          ),

        ],
      ),
    );
  }

  Widget buildStory(String name, image) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Story()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0),
        ]),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 60.0,
              width: 60.0,
              image: AssetImage("assets/$image"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPosts(String name, image, time) {
    return ListTile(
      leading: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0),
        ]),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 50.0,
              width: 50.0,
              image: AssetImage("assets/$image"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(time),
      trailing: IconButton(
        onPressed: null,
        icon: Icon(Icons.more_horiz),
        color: Colors.black,
      ),
    );
  }

  Widget buildPostsFull(String name, image, imageNetwork, time, posts, like) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Container(
        width: double.infinity,
        height: 540.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  buildPosts(name, image, time),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black45,
                        //       offset: Offset(0, 5),
                        //       blurRadius: 8.0),
                        // ],
                        image: DecorationImage(
                          image: NetworkImage(imageNetwork),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.favorite_border,
                                size: 30.0,
                              )),
                           Text(
                            like,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Row(
                            children:  [
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.chat,
                                    size: 30.0,
                                  )),
                              Text(
                                posts,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.bookmark_border,
                            size: 30.0,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
