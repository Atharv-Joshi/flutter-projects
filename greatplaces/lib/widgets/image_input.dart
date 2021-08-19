import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;

class ImageInput extends StatefulWidget {

  final Function? onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput>{

File? _storedImage;

Future<void> _takePicture() async {
  final picker = ImagePicker();
  final imageFile = await picker.pickImage(source: ImageSource.camera , maxWidth: 600);
  if(imageFile == null)
    {
      return;
    }

  setState(() {
    _storedImage = File(imageFile.path);
  });
  final appDir = await pathProvider.getApplicationDocumentsDirectory();
  final fileName = path.basename(imageFile.path);
  final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
  widget.onSelectImage!(savedImage);

}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1 , color: Colors.grey)
          ),
          child: _storedImage != null ?  Image.file(_storedImage! , fit: BoxFit.cover , width: double.infinity,) : Text('No Image Taken' , textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
          label: Text('Text Picture'),
          textColor: Theme.of(context).primaryColor,

    ),
      )
    ],
    );
  }
}
