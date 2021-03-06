import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:io';

class FirebaseMLApi {
  static Future<String> recogniseText(File imagefile) async {
    if (imagefile == null) {
      return 'No selected image';
    } else {
      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFile(imagefile);
      final TextRecognizer textRecogniser =
          FirebaseVision.instance.textRecognizer();
      try {
        final visionText = await textRecogniser.processImage(visionImage);
        await textRecogniser.close();

        final text = extractText(visionText);
        return text.isEmpty ? 'No text found in image' : text;
      } catch (e) {
        return e.toString();
      }
    }
  }

  static extractText(VisionText visionText) {
    String text = '';

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = text + word.text + ' ';
        }
        text = text + '\n';
      }
    }

    return text;
  }
}
