import 'package:flutter/material.dart';
import 'package:interview_landing_page/Sections/ContactUs/contact_us.dart';
import 'package:interview_landing_page/Sections/DownLoadApp/download_app.dart';
import 'package:interview_landing_page/Sections/GetStarted/get_started_desktop.dart';
import 'package:interview_landing_page/Sections/GetStarted/get_started_mobile.dart';
import 'package:interview_landing_page/Sections/ProfileTypes/profile_types.dart';
import 'package:interview_landing_page/Widgets/Footer/footer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => GetStartedMobile(),
                  desktop: (BuildContext context) => GetStartedDesktop(),
              ),
              // GetStartedView(),
              ProfileTypes(),
              DownloadApp(),
              ContactUs(),
              Footer(),


            ],
          ),
        ),
      ),
    );
  }
}
