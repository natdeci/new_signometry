import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('SIGNOMETRY'),
        backgroundColor: Colors.transparent,
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
      // Your Bottom Navigation Bar
    );
  }

  Widget _buildSignCard(String sign) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage('assets/$sign.jpeg'),  // Adjust based on your asset directory structure
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          sign.toUpperCase(),
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C2C2C), Colors.black],
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
        color: Colors.black,
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Navigate to Home Page
              },
            ),
            IconButton(
              icon: Icon(Icons.library_books, color: Colors.white),
              onPressed: () {
                // Navigate to Library Page
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
                
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for floating button
          Navigator.of(context).pushNamedAndRemoveUntil('/lock', ModalRoute.withName('/'));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
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
          setState(() {
            _currentIndex = 2;  // If you want the button to switch to a specific page.
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
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
                  _currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

