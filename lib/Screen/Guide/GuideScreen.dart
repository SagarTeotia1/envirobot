
import 'package:envirobot/Const/const_colo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:math';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        title: const Text('EnviroBot'),
        backgroundColor: Colors.white,
                actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
              Get.snackbar('Notification', 'No new notifications!');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Sagar"),
                accountEmail: Text("Ex@WiseWaste.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Sagar.jpg"),
                  onBackgroundImageError: (_, __) {
                    // Fallback image or text
                    debugPrint("Profile image not found.");
                  },
                   // Fallback icon
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF66785F),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Dashboard
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text("Categories"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Categories
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Community"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Community
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notifications"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Notifications Settings
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Account"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Account Settings
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text("Privacy Policy"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Privacy Policy
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help & Support"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Help & Support
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  // Handle Logout
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ModelViewer(
                  backgroundColor: Colors.transparent,
                  src: 'assets/images/avatar.glb',
                  alt: 'A 3D model of a character',
                  ar: true,
                  autoRotate: false,
                  disableZoom: false,
                  
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          AudioWaveformMicButton(
            isPlaying: _isPlaying,
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class AudioWaveformMicButton extends StatefulWidget {
  final bool isPlaying;
  final VoidCallback onPressed;

  const AudioWaveformMicButton({
    Key? key,
    required this.isPlaying,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AudioWaveformMicButtonState createState() => _AudioWaveformMicButtonState();
}

class _AudioWaveformMicButtonState extends State<AudioWaveformMicButton> with TickerProviderStateMixin {
  late final AnimationController _waveController;
  late final Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _waveAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _waveController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AudioWaveformMicButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _waveController.repeat(reverse: true);
    } else {
      _waveController.stop();
      _waveController.reset();
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _waveAnimation,
        builder: (context, child) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Waveform Animation
                Waveform(scale: _waveAnimation.value),
                Icon(
                  widget.isPlaying ? Icons.mic : Icons.mic_none,
                  size: 40,
                  color: Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Waveform extends StatelessWidget {
  final double scale;

  const Waveform({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
        ),
        child: CustomPaint(
          painter: WaveformPainter(),
        ),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double centerY = size.height / 2;

    // Draw the waveform path
    for (double x = 0; x < size.width; x++) {
      double y = centerY + sin(x / size.width * 2 * pi) * 20;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
