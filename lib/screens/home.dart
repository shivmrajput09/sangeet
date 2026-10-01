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
      extendBody: true, // बॉडी को नीचे तक ले जाने के लिए ताकि ग्लासमॉर्फिज्म इफ़ेक्ट सही दिखे
      
      // Column का उपयोग ताकि पेज, ग्लास प्लेयर बार और ग्लास बॉटम बार एक के ऊपर एक सही से फिट हों
      body: Stack(
        children: [
          // वर्तमान इंडेक्स के हिसाब से सही पेज
          _pages[_currentIndex],

          // ग्लासमॉर्फिज्म बॉटम पैनल (मिनी प्लेयर + बॉटम नेविगेशन बार)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // ब्लर इफ़ेक्ट
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF181818).withValues(alpha: 0.75), // ट्रांसलूसेंट बैकग्राउंड
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 1. ग्लास मिनी सॉन्ग प्लेयर बार
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NowPlayingScreen(
                                song: {
                                  'title': 'Barsat',
                                  'artist': 'Banjare',
                                  'coverUrl': 'assets/images/bairan.jfif',
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          color: Colors.transparent, // टच कैप्चर करने के लिए
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left Side: Cover Image & Song Details
                                  Expanded(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Image.asset(
                                            'assets/images/bairan.jfif',
                                            width: 38,
                                            height: 38,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Barsat",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "Banjare",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Right Side: Action Icons
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite,
                                        color: Color(0xFFE74C3C),
                                        size: 20,
                                      ),
                                      SizedBox(width: 16),
                                      Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                       SizedBox(width: 16),
                                      Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              
                              // Progress Bar Line
                              ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: const LinearProgressIndicator(
                                  value: 0.4,
                                  backgroundColor: Colors.white24,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFE74C3C),
                                  ),
                                  minHeight: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 2. ग्लासमॉर्फिज्म बॉटम नेविगेशन बार
                      BottomNavigationBar(
                        backgroundColor: Colors.transparent, // ट्रांसपेरेंट ताकि ब्लर दिखे
                        elevation: 0,
                        selectedItemColor: const Color(0xFFE74C3C),
                        unselectedItemColor: Colors.grey,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _currentIndex,
                        onTap: (index) {
                          setState(() {
                            _currentIndex = index;
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =================================================================
// 2. NOW PLAYING SCREEN (फुल स्क्रीन म्यूज़िक प्लेयर)
// =================================================================
class NowPlayingScreen extends StatelessWidget {
  final Map<String, String> song;

  const NowPlayingScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              song['coverUrl'] ?? 'assets/images/bairan.jfif',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                color: Colors.black.withValues(alpha: 0.65),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Playing from Daily Picks",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        song['coverUrl'] ?? 'assets/images/bairan.jfif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song['title'] ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              song['artist'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.favorite, color: Color(0xFFE74C3C), size: 28),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                    ),
                    child: Slider(
                      value: 0.4,
                      activeColor: const Color(0xFFE74C3C),
                      inactiveColor: Colors.white24,
                      onChanged: (value) {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1:12", style: TextStyle(color: Colors.white60, fontSize: 12)),
                        Text("3:45", style: TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.shuffle, color: Colors.white60, size: 22),
                      const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFE74C3C),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.pause, color: Colors.white, size: 32),
                          onPressed: () {},
                        ),
                      ),
                      const Icon(Icons.skip_next, color: Colors.white, size: 36),
                      const Icon(Icons.repeat, color: Colors.white60, size: 22),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =================================================================
// HOME CONTENT (आपका ओरिजिनल होम पेज डिज़ाइन)
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
              Color(0xFF6B1115),
              Color(0xFF121212),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // नीचे एक्सट्रा पैडिंग ताकि लिस्ट का आखिरी कंटेंट ग्लास बार के पीछे छुप न जाए
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 130.0),
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFE3D6CE).withValues(alpha: 0.12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
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
                                          maxLines: 2,
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
                        fontSize: 20,
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
                                        fontSize: 18,
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