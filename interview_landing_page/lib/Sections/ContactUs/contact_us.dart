import 'package:flutter/material.dart';
import 'package:interview_landing_page/Widgets/ContactUsForm/contact_us_form.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/contactUs.png',
          ),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 133 , vertical: 176),
        child: Row(
          children: [
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'CONTACT US',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w100
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 23, 0, 67),
                  child: Text(
                      'Drop us a message',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
               ContactUsForm(),
                TextButton(
                    onPressed: (){},
                    child: Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                    ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 19 , horizontal: 90)),
                    side: MaterialStateProperty.all(BorderSide(
                      color: Colors.black,
                      width: 1,
                    ))
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
