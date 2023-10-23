import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'interop.dart';
import 'dart:js' as js;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signometry App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/lock': (context) => LockPage(),
        '/dict': (context) => DisctionaryScreen(),
        '/prof': (context) => ProfileScreen(user: defaultUser),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DisctionaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E8AB3),
      appBar: AppBar(
        title: Text('S I G N O M E T R Y'),
        backgroundColor: Color(0xFF12243C),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // ASL Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'American Sign Language',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Numbers',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(height: 12.0),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: List.generate(10, (index) => _buildSignCard(index.toString())),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Alphabet',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(height: 12.0),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: 'abcdefghijklmnopqrstuvwxyz'.split('').map((letter) => _buildSignCard(letter)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF6172AA),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF12243C),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.library_books, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DisctionaryScreen()));
              },
            ),
            SizedBox(width: 50),  // Creates space for the floating action button
            IconButton(
              icon: Icon(Icons.lock, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/lock');
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/prof');
              },
            ),
          ],
        ),
      ),
      // Your Bottom Navigation Bar
    );
  }

  Widget _buildSignCard(String sign) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Add spacing between the boxes
      width: 150.0,  // Increase width
      height: 150.0,  // Increase height
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/$sign.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          sign.toUpperCase(),
          style: TextStyle(
            fontSize: 24.0,  // Increase font size
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class LockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S I G N O M E T R Y'),
        backgroundColor: Color(0xFF12243C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF7E8AB3),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF7E8AB3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIGNOMETRY+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text('No Ads', style: TextStyle(color: Colors.white)),
                Text('Unlock Other Sign Languages', style: TextStyle(color: Colors.white)),
                Text('Get Early Access on New Features', style: TextStyle(color: Colors.white)),
                Text('SIGNOMETRY+ Badge', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle purchase logic
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                  child: Text('Rp 59,999.00'),
                ),
                SizedBox(height: 10),
                Text(
                  'All of the income gained will go directly into further development and maintenance of the application.',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle restore purchases logic
                    },
                    child: Text('Restore Purchases'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF12243C),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Navigate to Home Page
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.library_books, color: Colors.white),
              onPressed: () {
                // Navigate to Library Page
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/dict');
              },
            ),
            SizedBox(width: 50),  // Creates space for the floating action button
            IconButton(
              icon: Icon(Icons.lock, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LockPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/prof');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for floating button
          // Navigator.of(context).pushNamedAndRemoveUntil('/lock', ModalRoute.withName('/'));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF6172AA),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class User {
  String name;
  String username;
  String email;
  String description;

  User({required this.name, required this.username, required this.email, required this.description});
}

User defaultUser = User(
  name: 'David Lemuel Lie',
  username: 'FilVram',
  email: 'David.lemuel@binus.ac.id',
  description: 'I am a very diligent person in studying.'
);

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E8AB3),
      appBar: AppBar(
        title: Text('S I G N O M E T R Y'),
        backgroundColor: Color(0xFF12243C),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Navigate to settings or perform another action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              // backgroundImage: AssetImage('path_to_your_image.jpg'), // Replace with your image path
              radius: 50,
            ),
            SizedBox(height: 20),
            ProfileInfo(title: 'Name          :', info: '${widget.user.name}'),
            ProfileInfo(title: 'Username      :', info: '${widget.user.username}'),
            ProfileInfo(title: 'Email address :', info: '${widget.user.email}'),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Badges :',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Badge(icon: Icons.star_border, label: 'S+'),
                // SizedBox(width: 10),
                // Badge(icon: Icons.book_online, label: 'D'),
                // SizedBox(width: 10),
                // Badge(icon: Icons.translate, label: 'ASL'),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description :',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20), // Adjust the height here for spacing after the Description
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${widget.user.description}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),  // Adjust this height for spacing between Description and Edit button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(user: widget.user)))
               .then((_) {
                  // This causes the widget to rebuild when you return from the EditProfileScreen
                  setState(() {});
                });
              },
              child: Text('Edit'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
            ),
            SizedBox(height: 20),  // Adjust this height for spacing between Edit and Sign Out button
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign Out'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF6172AA),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF12243C),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Navigate to Home Page
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.library_books, color: Colors.white),
              onPressed: () {
                // Navigate to Library Page
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/dict');
              },
            ),
            SizedBox(width: 50),  // Creates space for the floating action button
            IconButton(
              icon: Icon(Icons.lock, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/lock');
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen(user: widget.user)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
// class ProfileScreen extends StatelessWidget {
//   @override
//   final User user;
//   ProfileScreen({required this.user});
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF7E8AB3),
//       appBar: AppBar(
//         title: Text('S I G N O M E T R Y'),
//         backgroundColor: Color(0xFF12243C),
//         elevation: 0,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.white),
//             onPressed: () {
//               // Navigate to settings or perform another action
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CircleAvatar(
//               // backgroundImage: AssetImage('path_to_your_image.jpg'), // Replace with your image path
//               radius: 50,
//             ),
//             SizedBox(height: 20),
//             ProfileInfo(title: 'Name          :', info: '${user.name}'),
//             ProfileInfo(title: 'Username      :', info: '${user.username}'),
//             ProfileInfo(title: 'Email address :', info: '${user.email}'),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Badges :',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 // Badge(icon: Icons.star_border, label: 'S+'),
//                 // SizedBox(width: 10),
//                 // Badge(icon: Icons.book_online, label: 'D'),
//                 // SizedBox(width: 10),
//                 // Badge(icon: Icons.translate, label: 'ASL'),
//               ],
//             ),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Description :',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 20), // Adjust the height here for spacing after the Description
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.grey[600],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 '${user.description}',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 10),  // Adjust this height for spacing between Description and Edit button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(user: user)))
//                .then((_) {
//                   // This causes the widget to rebuild when you return from the EditProfileScreen
//                   setState(() {});
//                 });
//               },
//               child: Text('Edit'),
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
//             ),
//             SizedBox(height: 20),  // Adjust this height for spacing between Edit and Sign Out button
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Sign Out'),
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
//             ),
//             Spacer(flex: 3),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {

//         },
//         child: Icon(Icons.add),
//         backgroundColor: Color(0xFF6172AA),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         color: Color(0xFF12243C),
//         notchMargin: 6.0,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.home, color: Colors.white),
//               onPressed: () {
//                 // Navigate to Home Page
//                 Navigator.pop(context);
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.library_books, color: Colors.white),
//               onPressed: () {
//                 // Navigate to Library Page
//                 Navigator.pop(context);
//                 Navigator.of(context).pushNamed('/dict');
//               },
//             ),
//             SizedBox(width: 50),  // Creates space for the floating action button
//             IconButton(
//               icon: Icon(Icons.lock, color: Colors.white,),
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.of(context).pushNamed('/lock');
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.person, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen(user: user)));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfileInfo extends StatelessWidget {
  final String title;
  final String info;

  ProfileInfo({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18))),
          Text(info, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _usernameController = TextEditingController(text: widget.user.username);
    _emailController = TextEditingController(text: widget.user.email);
    _descriptionController = TextEditingController(text: widget.user.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Update user object
              widget.user.name = _nameController.text;
              widget.user.username = _usernameController.text;
              widget.user.email = _emailController.text;
              widget.user.description = _descriptionController.text;

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email Address')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

void stopCamera() {
    js.context.callMethod('stopCamera', []);
}
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Page 1')),
    Center(child: Text('Page 2')),
    Container(),  // Empty container for the middle tab.
    Center(child: Text('Page 3')),
    Center(child: Text('Page 4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        if (_currentIndex != 2) { // If not on the camera screen
            setState(() {
                _currentIndex = 2;
            });
            html.document.getElementById('camera')!.hidden = false;
            getCamera();
        } else {
            stopCamera();
            setState(() {
                _currentIndex = 0; // Navigate away or reset the UI after closing the camera
            });
        }
        },
        backgroundColor: Color(0xFF6172AA),
        child: Icon(_currentIndex != 2 ? Icons.camera : Icons.close),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF12243C),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.library_books, color: Colors.white),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.of(context).pushNamed('/dict');
              },
            ),
            SizedBox(width: 50),  // Creates space for the floating action button
            IconButton(
              icon: Icon(Icons.lock, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).pushNamed('/lock');
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed('/prof');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

