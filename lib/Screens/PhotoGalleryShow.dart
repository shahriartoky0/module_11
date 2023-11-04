import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../ImagesInfo.dart';
import 'ImageInfoScreen.dart';

class PhotoGalleryShow extends StatefulWidget {
  const PhotoGalleryShow({super.key});

  @override
  State<PhotoGalleryShow> createState() => _PhotoGalleryShowState();
}

class _PhotoGalleryShowState extends State<PhotoGalleryShow> {
  List photoDetailsList = [];
  bool error = false;

  void getPhotoList() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // print(response.body);
    if (response.statusCode == 200) {
      List responseData = jsonDecode(response.body);
      for (Map<String, dynamic> imageData in responseData) {
        photoDetailsList.add(
            ImagesInfo(imageData['url'], imageData['title'], imageData['id']));
      }
    }
    if (response.statusCode == 400 || response.statusCode == 404) {
      error = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    getPhotoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: error
          ? Image.network(
              'https://www.lifewire.com/thmb/auk-givypeTY383aFHJnpl6fQSU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/404-not-found-error-explained-2622936-Final-fde7be1b7e2e499c9f039d97183e7f52.jpg')
          : ListView.separated(
              itemCount: photoDetailsList.length,
              itemBuilder: (context, index) {
                final photoDetails = photoDetailsList[index];
                return ListTile(
                  title: Text('${photoDetails.title}'),
                  leading: Image.network(
                      'https://www.ryanscomputers.com/storage/products/small/dynabook-toshiba-satellite-pro-c40-g-109-intel-11681618797.webp'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageInfoScreen(
                                  image: photoDetails,
                                )));
                  },
                );
              },
              separatorBuilder: (_, __) {
                return const Divider();
              }),
    );
  }
}
