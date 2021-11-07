import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

   _launchInstagram() async
   {
     final url = 'https://www.instagram.com/the_rachiron/' ;
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  _launchGithub() async
  {
    final url = 'https://github.com/Atharv-Joshi' ;
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  _launchLinkedIn() async
  {
    final url = 'https://www.linkedin.com/in/atharv-joshi-a9220a191/' ;
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: SelectableText(
              'LocalBitz',
              textAlign: TextAlign.center,
              style: GoogleFonts.dosis(
                color: Colors.white,
                  letterSpacing: 2,
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  )
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Made with  ',
              style:  TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              children: const <TextSpan>[
                TextSpan(text: 'Flutter',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlueAccent
                  ),),
              ],
            ),
          ),
          // SelectableText(
          //   'Made with Flutter',
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.lightBlueAccent
          //   ),
          // ),
           Row(
            children: [
              IconButton(onPressed: _launchInstagram, icon: Image.asset('assets/images/instagram.png' ,),),
              IconButton(onPressed: _launchGithub, icon: Image.asset('assets/images/github.png' , ),),
              IconButton(onPressed: _launchLinkedIn, icon: Image.asset('assets/images/linkedin.png' , ),),
            ],
          ),
        ],
      )
      ,
    );
  }
}
