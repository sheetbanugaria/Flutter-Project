import 'package:flutter/material.dart';
import 'package:matrimonyapp/Project/UserList.dart';

class AddUser extends StatefulWidget {
  final List<Map<String, dynamic>> userDetails;
  final List<Map<String, dynamic>> favoriteUsers;
  final Function(Map<String, dynamic>) onFavorite;
  final Function(Map<String, dynamic>) onDelete;

  AddUser({
    required this.userDetails,
    required this.favoriteUsers,
    required this.onFavorite,
    required this.onDelete,
  });

  @override
  State<AddUser> createState() => _AddUserState();
}



class Hobbies extends StatefulWidget {
  final Function(List<String>) onHobbiesChanged;

  Hobbies({required this.onHobbiesChanged});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  bool s4 = false;
  bool s5 = false;
  bool s6 = false;

  List<String> getSelectedHobbies() {
    List<String> hobbies = [];
    if (s1) hobbies.add('Reading');
    if (s2) hobbies.add('Sports');
    if (s3) hobbies.add('Cooking');
    if (s4) hobbies.add('Music');
    if (s5) hobbies.add('Swimming');
    if (s6) hobbies.add('Travelling');
    return hobbies;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Hobbies :',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CheckboxListTile(
                title: Text('Reading'),
                value: s1,
                onChanged: (bool? value) {
                  setState(() {
                    s1 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
              CheckboxListTile(
                title: Text('Sports'),
                value: s2,
                onChanged: (bool? value) {
                  setState(() {
                    s2 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
              CheckboxListTile(
                title: Text('Cooking'),
                value: s3,
                onChanged: (bool? value) {
                  setState(() {
                    s3 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
              CheckboxListTile(
                title: Text('Music'),
                value: s4,
                onChanged: (bool? value) {
                  setState(() {
                    s4 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
              CheckboxListTile(
                title: Text('Swimming'),
                value: s5,
                onChanged: (bool? value) {
                  setState(() {
                    s5 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
              CheckboxListTile(
                title: Text('Travelling'),
                value: s6,
                onChanged: (bool? value) {
                  setState(() {
                    s6 = value ?? false;
                  });
                  widget.onHobbiesChanged(getSelectedHobbies());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _AddUserState extends State<AddUser> {
  final _key = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final dateOfBirth = TextEditingController();
  final city = TextEditingController();
  String? selectedGender;
  final password = TextEditingController();

  List<String> selectHobbies = [];
  List<Map<String, dynamic>> userDetails = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
          backgroundColor: Colors.yellow,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'First Name :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: firstname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your First Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          if (!RegExp(r"^[a-zA-Z\s\-']{3,50}$")
                              .hasMatch(value)) {
                            return 'Enter a valid FirstName';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //FirstName
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Last Name :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: lastname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your Last Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          if (!RegExp(r"^[a-zA-Z\s\-']{3,50}$")
                              .hasMatch(value)) {
                            return 'Enter a valid FirstName';                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //LastName
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Email :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //Email
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Mobile Number :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: mobile,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your Mobile Number"),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                            return 'Enter a valid mobile number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //Mobile
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Date of birth :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: dateOfBirth,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your DOB"),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          if (!RegExp(
                              r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid date of birth in DD/MM/YYYY';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //DOB
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'City :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: city,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your City"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          if (!RegExp(r"^[a-zA-Z\s\-']{3,50}$")
                              .hasMatch(value)) {
                            return 'Enter a valid city';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),//City
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Gender :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedGender,
                        hint: Text('Select Gender'),
                        items: [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'Others',
                            child: Text('Others'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Hobbies(onHobbiesChanged: (hobbies) {
                  setState(() {
                    selectHobbies = hobbies;
                  });
                },),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Password :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your Password"),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ), //Password
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Confirm Password :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Confirm your Password"),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ), //Confirm
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          widget.userDetails.add({
                            'firstname': firstname.text,
                            'lastname': lastname.text,
                            'email': email.text,
                            'mobile': mobile.text,
                            'dateOfBirth': dateOfBirth.text,
                            'city': city.text,
                            'gender': selectedGender,
                            'hobbies': selectHobbies,
                            'password': password.text,
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserList(
                                userDetails: widget.userDetails,
                                favoriteUsers: widget.favoriteUsers,
                                onFavorite: widget.onFavorite,
                                onDelete: widget.onDelete,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Reset'))
                  ],
                ), //Submit
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
