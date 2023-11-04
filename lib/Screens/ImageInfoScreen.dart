import 'package:flutter/material.dart';
import 'package:module_11/Screens/PhotoGalleryShow.dart';

import '../ImagesInfo.dart';

class ImageInfoScreen extends StatefulWidget {
  const ImageInfoScreen({super.key, required this.image});

  final ImagesInfo image;

  @override
  State<ImageInfoScreen> createState() => _ImageInfoScreenState();
}

class _ImageInfoScreenState extends State<ImageInfoScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                  widget.image.image ??
                      'https://demofree.sirv.com/nope-not-here.jpg',
                  errorBuilder: (context, error, stackTrace) {
                // Handle the error gracefully
                return Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToo_NT9qKJDSlF_7y3K_OhKxH5feCJ0Qc4tZ-5c3DFch_rfiAhljXwHvnhpZgoS8qIsJs&usqp=CAU');
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Title: ${widget.image.title ?? 'No Title Available'}'),
            const SizedBox(
              height: 10,
            ),
            Text('ID: ${widget.image.id ?? 'No ID found'}')
          ],
        ),
      ),
    );
  }
}
