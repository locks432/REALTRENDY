import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

class PostCreationScreen extends StatelessWidget {
  const PostCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProImageEditor.network(
      'https://picsum.photos/id/237/2000',
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (bytes) async {
          Navigator.pop(context);
        },
      ),
    );
  }
}
