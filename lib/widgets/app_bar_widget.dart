import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final bool isHomePage;
  const AppBarWidget({super.key, this.isHomePage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C1B1F),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (!isHomePage) Navigator.pop(context);
                },
                child: Icon(
                  isHomePage ? Icons.menu : Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Image.asset('assets/images/code_start_logo.png'),
                  Text(
                    'RICK AND MORTY API', 
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white, fontSize: 14.5, letterSpacing: 1.6),
                    ),
                  )
                ],
              ),
              Icon(Icons.person, color: Colors.white),
            ],
          )
        )
      )
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(131);
}