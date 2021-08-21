import 'package:flutter/material.dart';



class GSTLedgersTile extends StatefulWidget {
  final image;
  final type;

  GSTLedgersTile(
  {
    required this.image,
    required this.type
}
      );

  @override
  _GSTLedgersTileState createState() => _GSTLedgersTileState();
}

class _GSTLedgersTileState extends State<GSTLedgersTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Row(
        children: [
          Container(
            color: Color(0xffEEEEEE),
            child: Row(
              children: [
                Image.asset(
                    widget.image,
                    height: 73,
                  width: 73,
                ),
                Container(
                  width: 100,
                  child: Text(
                    widget.type,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff3F3D56).withOpacity(0.44),
                      fontWeight : FontWeight.w700,
                      fontSize: 27
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // decoration: BoxDecoration(
            //     border: Border.all()
            // ),
            // width: double.infinity,
            // child: TextFormField(
            //   decoration: textFieldDecoration.copyWith(hintText: widget.type),
            // ),
          ),
        ],
      ),
    );
  }
}
