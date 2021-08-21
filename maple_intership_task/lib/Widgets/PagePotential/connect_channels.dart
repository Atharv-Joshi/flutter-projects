import 'package:flutter/material.dart';
import 'package:maple_intership_task/Widgets/Tiles/channel_tile.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';

class ConnectChannels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: HeadingText(text: 'Connect Channels'),
          ),
          ChannelTile(logo: 'assets/images/amazon_logo_long.png' , title: 'amazon',),
          ChannelTile(logo: 'assets/images/flipkart_logo_long.png' , title: 'flipkart',),
          ChannelTile(logo: 'assets/images/amazon_logo_long.png' , title: 'amazon',),
          ChannelTile(logo: 'assets/images/amazon_logo_long.png' , title: 'amazon',)
        ],
      ),
    );
  }
}
