import 'package:flutter/material.dart';
import 'dart:ui';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dailyPicks = const [
      {
        'title': 'Bairan',
        'artist': 'Banjare',
        'coverUrl': './assets/images/bairan.jfif',
      },
      {
        'title': 'Afsos',
        'artist': 'Anuv Jain',
        'coverUrl': './assets/images/Afsos.jfif',
      },
      {
        'title': 'Sukoon',
        'artist': 'Adtiya Rikhari',
        'coverUrl': './assets/images/Sukoon.jfif',
      },
      {
        'title': 'Tumhe Dillagi',
        'artist': 'Nusrat Fateh Ali Khan',
        'coverUrl': './assets/images/NFAK.jfif',
      },
    ];

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
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
                        children: [
                          Text(
                            "Hello shivam",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white.withOpacity(0.80),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Let's listen to something cool today",
                            style: TextStyle(
                              fontSize: 10,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE3D6CE),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              const Icon(
                                Icons.notifications_outlined,
                                color: Color(0xFFE3D6CE),
                                size: 24,
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE74C3C),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 18),
                          const Icon(
                            Icons.settings_outlined,
                            color: Color(0xFFE3D6CE),
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),











                // Glassmorphism Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

color: const Color(0xFFE3D6CE).withOpacity(0.12), // यह हल्का वार्म-मिल्की ब्लर शेड देगा                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(
                    //   color: Colors.white12.withOpacity(0.1),
                    //   width: 0.5,
                    // ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Daily fours for you",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFE3D6CE),
                                    ),
                                  ),
                                  Text(
                                    "Recommendation is based on your previous day",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFFE3D6CE),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0, right: 4.0),
                                child: SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    value: 0.25,
                                    strokeWidth: 2.5,
                                    backgroundColor: Colors.white.withOpacity(0.80),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFFE74C3C),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
// Horizontal ListView for Cards
 // Horizontal ListView for Cards (Without individual card background)
SizedBox(
  height: 110, // Card ki total height (image + text ke hisaاب se)
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: dailyPicks.length,
    //  Yahan humne cards ke beech ka exact gap/spacing de di hai
    separatorBuilder: (context, index) => const SizedBox(width: 15), 
    itemBuilder: (context, index) {
      final item = dailyPicks[index];
      return SizedBox(
        width: 62, //  Tumne jo 62 width boli thi, wo yahan fix kar di hai!
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cover Image Container
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['coverUrl']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Song Title
            Text(
              item['title']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFFEBD9CE),
              ),
            ),
            // Artist Name
            Text(
              item['artist']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9,
                color: Color(0xFFE3D6CE),
              ),
            ),
          ],
        ),
      );
    },
  ),
),           ],
                      ),
                    ),
                  ),
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
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }
}