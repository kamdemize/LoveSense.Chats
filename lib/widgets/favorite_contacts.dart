import 'package:flutter/material.dart';
import 'package:matchforlive/data/init.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Favorite Contacts',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                    ),
                    iconSize: 30,
                    color: Colors.blueGrey,
                    onPressed: () {},
                  ),
                ]),
          ),
          Container(
              height: 120.0,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          favorites[index].name,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
