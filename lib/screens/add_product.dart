import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_online/screens/homepage.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  Future saveProduct() async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2:8000/api/products"), body: {
      "name": nameController.text,
      "decription": descriptionController.text,
      "price": priceController.text,
      "image_url": imageUrlController.text
    });
    print(response.body);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
        ),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nama"),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: "Image Url"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveProduct().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  },
                  child: Text("Save"))
            ],
          ),
        ));
  }
}
