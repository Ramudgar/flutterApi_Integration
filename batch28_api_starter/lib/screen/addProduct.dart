import 'dart:io';

import 'package:batch28_api_starter/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Load camera and gallery images and store it to the File object.
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              width: MediaQuery.of(context).size.width * 0.44,
              child: _displayImage(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: ElevatedButton.icon(
                onPressed: () {
                  _loadImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_enhance),
                label: const Text('Open Camera'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: ElevatedButton.icon(
                onPressed: () {
                  _loadImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.browse_gallery_sharp),
                label: const Text('Open Gallery'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {
                  ProductRepository().addProduct(img);
                  // Navigator.pop(context);
                },
                label: const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
        side: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: ClipRRect(
        // For rounded upper right corner and left corner in imageview

        // borderRadius: BorderRadius.circular(20),
        child: SizedBox(
            child: img == null
                ? Image.network(
                    'http://www.clker.com/cliparts/o/G/p/l/g/M/add-student-hi.png',
                    fit: BoxFit.fill,
                    // height: MediaQuery.of(context).size.height * 0.3,
                    // width: MediaQuery.of(context).size.width * 0.7,
                  )
                : Image.file(img!)),
      ),
    );
  }
}
