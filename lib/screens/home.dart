import 'package:flutter/material.dart';
import 'dart:ui';

import 'search.dart';
import 'podcast.dart';
import 'playlist.dart';

// 1. StatefulWidget ताकि टैब बदलने पर स्क्रीन अपडेट हो सके
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // वर्तमान में सेलेक्टेड टैब का इंडेक्स (0 = Home)
  int _currentIndex = 0;

  // चारों पेजेस की लिस्ट (जो आपके फोल्डर में मौजूद हैं)
  final List<Widget> _pages = [
    const HomeContent(),     // आपका पूरा होम पेज डिज़ाइन
    const SearchScreen(),    // सर्च पेज
    const PodcastScreen(),   // पॉडकास्ट पेज
    const PlaylistScreen(),  // प्लेलिस्ट / लाइब्रेरी पेज
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      
      // वर्तमान इंडेक्स के हिसाब से सही पेज दिखाएगा
      body: _pages[_currentIndex],

      // बॉटम नेविगेशन बार जिसपर क्लिक करने से टैब बदलेंगे
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: const Color(0xFFE74C3C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // क्लिक करते ही टैब बदल जाएगा
          });
        },
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

// =================================================================
// HOME CONTENT (आपका ओरिजिनल होम पेज डिज़ाइन - बिना किसी बदलाव के)
// =================================================================
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dailyPicks = const [
      {
        'title': 'Bairan',
        'artist': 'Banjare',
        'coverUrl': 'assets/images/bairan.jfif',
      },
      {
        'title': 'Afsos',
        'artist': 'Anuv Jain',
        'coverUrl': 'assets/images/Afsos.jfif',
      },
      {
        'title': 'Sukoon',
        'artist': 'Adtiya Rikhari',
        'coverUrl': 'assets/images/Sukoon.jfif',
      },
      {
        'title': 'Tumhe Dillagi',
        'artist': 'Nusrat Fateh Ali Khan',
        'coverUrl': 'assets/images/NFAK.jfif',
      },
    ];

    final List<Map<String, String>> userPics = const [
      {
        'title': "Tera Hua",
        'artist': "Vishal Mishra",
        'coverUrl': "assets/images/VM.jfif"
      },
      {
        'title': "jai jai Ram",
        'artist': "A.R. Rehman",
        'coverUrl': "assets/images/AR.jfif"
      },
      {
        'title': "Ashiq",
        'artist': "Arjit Singh",
        'coverUrl': "assets/images/as.jfif"
      },
      {
        'title': "Bairan",
        'artist': "Banjare",
        'coverUrl': "assets/images/bairan.jfif"
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
              Color(0xFF6B1115), // Deep maroon/red top
              Color(0xFF121212), // Dark bottom
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Custom Header
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
                              color: Colors.white.withValues(alpha: 0.80),
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

                // Glassmorphism Container (Daily Picks)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFE3D6CE).withValues(alpha: 0.12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
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
                                    backgroundColor: Colors.white.withValues(alpha: 0.80),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFFE74C3C),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 110,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: dailyPicks.length,
                              separatorBuilder: (context, index) => const SizedBox(width: 15),
                              itemBuilder: (context, index) {
                                final item = dailyPicks[index];
                                return SizedBox(
                                  width: 62,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
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
                                      Text(
                                        item['title']!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFEBD9CE),
                                        ),
                                      ),
                                      Text(
                                        item['artist']!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFE3D6CE),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Level 3: Recent Played Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent played",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white.withValues(alpha: 0.80),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: dailyPicks.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final song = dailyPicks[index];

                          return SizedBox(
                            width: 92,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 48,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 92,
                                      height: 92,
                                      child: Image.asset(
                                        song['coverUrl']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  song['title']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withValues(alpha: 0.80),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  song['artist']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.white.withValues(alpha: 0.60),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Level 4: Artists Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Artists",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white.withValues(alpha: 0.80),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 210,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: userPics.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final artist = userPics[index];

                          return SizedBox(
                            width: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    artist['coverUrl']!,
                                    fit: BoxFit.cover,
                                    height: 210,
                                    width: 130,
                                  ),
                                  Positioned.fill(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.7),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 12,
                                    left: 10,
                                    right: 10,
                                    child: Text(
                                      artist['artist']!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withValues(alpha: 0.80),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}