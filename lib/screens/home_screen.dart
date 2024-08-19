import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  double turns = 0;
  String text = "Mushroom";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Stack for background circle and pizza image
          Positioned(
            top: 0,
            bottom: 0,
            right: -(size.height / 1.5),
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(milliseconds: 800),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Circle
                  Container(
                    width: size.height,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Pizza Image
                  Positioned(
                    left: -(size.height / 4),
                    top: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/pizza${selectedIndex + 1}.png', // Add your pizza image in the assets folder
                      height: size.height / 2,
                      width: size.height / 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Navigation Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/dominos_logo.png', // Add your Domino's logo in the assets folder
                      height: 73,
                    ),
                    Row(
                      children: [
                        _buildNavItem('HOME', true),
                        const SizedBox(width: 24,),
                        _buildNavItem('ABOUT US', false),
                        const SizedBox(width: 24,),
                        _buildNavItem('ITEMS', false),
                        const SizedBox(width: 24,),
                        _buildNavItem('CATEGORIES', false),
                        const SizedBox(width: 24,),
                        _buildNavItem('CONTACT', false),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 100),
                // Today's Special Text
                Text(
                  "Today's Special",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    letterSpacing: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // Mushroom Lover Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.inter(
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Lover",
                      style: GoogleFonts.inter(
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 8,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEC603A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                // Pizza Selection Row
                Row(
                  children: [
                    _buildPizzaOption(0, "Mushroom"),
                    const SizedBox(width: 16,),
                    _buildPizzaOption(1, "Vegitables"),
                    const SizedBox(width: 16,),
                    _buildPizzaOption(2, "Paneerhot"),
                    const SizedBox(width: 16,),
                    _buildPizzaOption(3, "Prawnhot"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, bool isActive) {
    return Text(
      title,
      style: GoogleFonts.inter(fontSize: 13, fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
    );
  }

  Widget _buildPizzaOption(int index, String title) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
          turns += 1;
          text = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        height: index == selectedIndex ? 100 : 75,
        width: index == selectedIndex ? 100 : 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Image.asset(
          'assets/pizza${index+1}.png',
          height: index == selectedIndex ? 100 : 75,
          width: index == selectedIndex ? 100 : 75,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
