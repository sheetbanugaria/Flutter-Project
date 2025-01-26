import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteUsers;
  final Function(Map<String, dynamic>) onUnfavorite;

  Favourite({required this.favoriteUsers, required this.onUnfavorite});

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late Set<Map<String, dynamic>> favoriteSet;

  @override
  void initState() {
    super.initState();
    favoriteSet = widget.favoriteUsers.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favourite'),
          backgroundColor: Colors.yellow,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: favoriteSet.isEmpty
            ? Center(
          child: Text('No Favourite Users'),
        )
            : ListView.builder(
          itemCount: widget.favoriteUsers.length,
          itemBuilder: (context, index) {
            final user = widget.favoriteUsers[index];
            final isFavorite = favoriteSet.contains(user);

            return Card(
              margin: EdgeInsets.all(8.0),
              elevation: 5,
              child: ListTile(
                title: Text('${user['firstname']} ${user['lastname']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username: ${user['firstname']} ${user['lastname']}'),
                    Text('Email: ${user['email']}'),
                    Text('Mobile: ${user['mobile']}'),
                    Text('Date of Birth: ${user['dateOfBirth']}'),
                    Text('City: ${user['city']}'),
                    Text('Gender: ${user['gender']}'),
                    Text('Hobbies: ${user['hobbies'].join(', ')}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isFavorite) {
                        favoriteSet.remove(user);
                        widget.onUnfavorite(user);
                      } else {
                        favoriteSet.add(user);
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
