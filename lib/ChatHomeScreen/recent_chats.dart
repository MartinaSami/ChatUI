import 'package:chat_page/AppColorCodes.dart';
import 'package:chat_page/ChatHomeScreen/profile.dart';
import 'package:chat_page/ChatHomeScreen/requests.dart';
import 'package:flutter/material.dart';
import 'package:chat_page/models/chat_model.dart';
import 'package:chat_page/chats/chatScreen.dart';

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    return !isDark
        ? buildScaffold(context, pPrimaryColor, Colors.white)
        : buildScaffold(context, Colors.transparent, Colors.transparent);
  }

  Scaffold buildScaffold(BuildContext context, Color bgColor, Color contain) {
    return Scaffold(
    backgroundColor: bgColor,
    appBar: AppBar(
      backgroundColor: pPrimaryColor,
      title: Text('Chats'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: Datasearch());
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 40,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/happy-man.png'))),
          ),
        )
      ],
    ),
    body: Column(
    
      children: [
        Container(
        
            color: pPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                       Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Chats()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: Text(
                      "Recent Chats",
                      style: TextStyle(
                        color: pPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Stack(
                    children: [
                      MaterialButton(
                        onPressed: () {
                           Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Requests()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white),
                        ),
                        elevation: 0,
                        color: Colors.transparent,
                        child: Text(
                          "Requests",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.1,
                        top: 0.1,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                '9+',
                                style: TextStyle(
                                    color: pPrimaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        Expanded(
          
          child: Container(
              decoration: BoxDecoration(
                 color: contain,
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Favourite Contacts',
                            style: TextStyle(
                                // color: Colors.grey[800],
                                fontWeight: FontWeight.w600)),
                        Icon(Icons.star)
                      ],
                    ),
                  ),
                  Container(
                    height: 110.0,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: favorites.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage(favorites[index].imageUrl),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                favorites[index].name,
                                style: TextStyle(
                                    // color: Colors.grey[850],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chatting()));
                        },
                        child: ListView.builder(
                            itemCount: chatsData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pDefaultPadding,
                                    vertical: pDefaultPadding * 0.75),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                              chatsData[index].image),
                                        ),
                                        if (chatsData[index].isActive)
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                    width: 3,
                                                  )),
                                            ),
                                          )
                                      ],
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: pDefaultPadding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            chatsData[index].name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Opacity(
                                              opacity: 0.7,
                                              child: Text(
                                                chatsData[index].lastMessage,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis,
                                              ))
                                        ],
                                      ),
                                    )),
                                    Opacity(
                                        opacity: 0.7,
                                        child: Text(chatsData[index].time))
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: pPrimaryColor,
      child: Icon(
        Icons.person_add_alt_1_rounded,
        color: Colors.white,
      ),
    ),
  );
  }
}

class Datasearch extends SearchDelegate<String> {
  final names = [
    'deepa',
    'deepak',
    'suvam',
    'balram',
    'suvam pandey',
    'deepa pandey',
    'ayush mishra',
    'dipa',
    'steen',
    'steen locas',
    'balram rathore',
    'ritu',
    'riya',
  ];
  final recentSearches = [
    'deepak',
    'joty',
    'suvam',
    'ayush',
    'riya',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.mic),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : names.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.person_search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
