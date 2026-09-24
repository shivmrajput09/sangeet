import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6B1115), // Upar wala deep maroon/red
              Color(0xFF121212), 
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:   [
                          Text(
                            "Hello shivam",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.80),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Let's listen to something cool today",
                            style: TextStyle(
                              fontSize: 10,
                              height: 1.1,
                              color: Color(0xFFE3D6CE), // Soft milky/warm tone
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Notification Icon with Red Dot Badge
                          Stack(
                            children: [
                              const Icon(
                                Icons.notifications_outlined,
                                color: Color(0xFFF4F4F6),
                                size: 20,
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE74C3C), // Red Dot Badge
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 18),
                          const Icon(
                            Icons.settings_outlined,
                              color: Color(0xFFE3D6CE), // Soft milky/warm tone
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),










       SizedBox( 
        
       ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: const Color(0xFFE74C3C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: 'Podcasts'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xFFE74C3C),
              child: Text(
                "S",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }
}