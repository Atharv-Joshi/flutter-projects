import 'package:flutter/material.dart';
import 'package:interview_landing_page/Widgets/GetStartedContent/get_started_content_mobile.dart';
import 'package:interview_landing_page/Widgets/NavigationBar/navigation_bar_mobile.dart';

class GetStartedMobile extends StatelessWidget {
  const GetStartedMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1D1D1D),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            NavigationBarMobile(),
            GetStartedContentMobile()
          ],
        ),
      ),
    );
  }
}
