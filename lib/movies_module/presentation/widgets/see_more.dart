import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMore extends StatelessWidget {
   SeeMore({super.key,required this.text});
  String text ='';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO POPULAR SCREEN
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('See More',style: TextStyle(color: Colors.white,),),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
