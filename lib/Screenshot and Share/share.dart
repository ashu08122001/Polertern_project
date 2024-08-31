import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';





class Share extends StatelessWidget {
  Share({super.key});

  final ScreenshotController _screenshotController=ScreenshotController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _takeScreenshot();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          child: Icon(
            Icons.share_outlined,

          ),
        ),
      ),
    );
  }
  void _takeScreenshot() async{
    final imageFile = await _screenshotController.capture(pixelRatio: 2);



    }
}
