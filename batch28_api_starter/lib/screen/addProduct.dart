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

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.29,
                width: MediaQuery.of(context).size.width * 0.44,
                child: _displayImage(),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
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
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _loadImage(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.browse_gallery_sharp),
                      label: const Text('Open Gallery'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Product Name',
                hintText: 'Enter Product Name',
                border: OutlineInputBorder(),
              )),
              const SizedBox(height: 5),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Product Description',
                hintText: 'Enter Product Description',
                border: OutlineInputBorder(),
              )),
              const SizedBox(height: 5),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Product Price',
                hintText: 'Enter Product Price',
                border: OutlineInputBorder(),
              )),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color.fromARGB(255, 101, 98, 98),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 34,
                    isExpanded: true,

                    elevation: 0,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    borderRadius: BorderRadius.circular(10),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'count in stock',
                hintText: 'Enter count in stock',
                border: OutlineInputBorder(),
              )),
              const SizedBox(height: 5),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Product Rating',
                hintText: 'Enter Product Rating',
                border: OutlineInputBorder(),
              )),
              const SizedBox(height: 5),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Product Review',
                hintText: 'Enter Product Review',
                border: OutlineInputBorder(),
              )),
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
