import 'package:flutter/material.dart';
import 'package:matrimonyapp/Project/AboutUs.dart';
import 'package:matrimonyapp/Project/AddUser.dart';
import 'package:matrimonyapp/Project/Favourite.dart';
import 'package:matrimonyapp/Project/UserList.dart';

void main() {
  runApp(Homescreen(userDetails: []));
}

class Homescreen extends StatefulWidget {
  final List<Map<String, dynamic>> userDetails;

  Homescreen({required this.userDetails});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> favouriteuser = [];
  List<Map<String, dynamic>> userDetails = [];

  void favouriteUser(Map<String, dynamic> user) {
    setState(() {
      if (favouriteuser.contains(user)) {
        favouriteuser.remove(user);
      } else {
        favouriteuser.add(user);
      }
    });
  }


  void deleteUser(Map<String, dynamic> user) {
    setState(() {
      userDetails.remove(user);
      favouriteuser.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> iconlist = [
      {
        'icon': Icons.person_add,
        'title': 'Add User',
        'path': AddUser(
          userDetails: userDetails,
          favoriteUsers: favouriteuser,
          onFavorite: favouriteUser,
          onDelete: deleteUser,
        ),
      },
      {
        'icon': Icons.list,
        'title': 'User List',
        'path': UserList(
          userDetails: userDetails,
          favoriteUsers: favouriteuser,
          onFavorite: favouriteUser,
          onDelete: deleteUser,
        ),
      },
      {
        'icon': Icons.favorite,
        'title': 'Favourite',
        'path': Favourite(
          favoriteUsers: favouriteuser,
          onUnfavorite: (user) {
            setState(() {
              favouriteuser.remove(user);
            });
          },
        ),
      },
      {'icon': Icons.info, 'title': 'About Us', 'path': AboutUs()},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Matrimonial'),
          backgroundColor: Colors.yellow,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: iconlist.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => iconlist[index]['path'],
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconlist[index]['icon'], size: 50.0),
                      SizedBox(height: 10.0),
                      Text(
                        iconlist[index]['title'],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
