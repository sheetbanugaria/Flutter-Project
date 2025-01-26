import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<Map<String, dynamic>> userDetails;
  final List<Map<String, dynamic>> favoriteUsers;
  final Function(Map<String, dynamic>) onFavorite;
  final Function(Map<String, dynamic>) onDelete;

  UserList({
    required this.userDetails,
    required this.favoriteUsers,
    required this.onFavorite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: userDetails.isEmpty
          ? Center(child: Text('No Users Found'))
          : ListView.builder(
        itemCount: userDetails.length,
        itemBuilder: (context, index) {
          final user = userDetails[index];
          final isFavorite = favoriteUsers.contains(user);
          return Card(
            color: Colors.grey.shade200,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 10,
            child: Stack(
              children: [
                ListTile(
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
                ),
                Positioned(
                  right: 16,
                  top: 10,
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          onFavorite(user);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          print("Delete clicked for: $user");
                          onDelete(user);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
