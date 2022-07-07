import 'package:firebase_testv2/services/firestore.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:firebase_testv2/widgets/bottomsheet_widget.dart';
import 'package:firebase_testv2/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = GlobalKey<FormState>();
  double price = 0.0;
  String description = '';
  String name = '';
  late XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Añadir Producto'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildName(),
              const SizedBox(height: 5),
              buildPrice(),
              const SizedBox(height: 16),
              buildEmail(),
              const SizedBox(height: 10),
              buildImage(),
              const SizedBox(height: 25),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildPrice() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Precio',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 2) {
            return 'Enter at least 2 characters';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (value) => setState(() => price = double.parse(value!)),
      );

  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Descripción',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter an email';
          } else {
            return null;
          }
        },
        maxLength: 50,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => description = value!),
      );

  Widget buildName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Nombre',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter an email';
          } else {
            return null;
          }
        },
        maxLength: 25,
        keyboardType: TextInputType.name,
        onSaved: (value) => setState(() => name = value!),
      );
  Widget buildImage() => Center(
        child: GestureDetector(
          child: FaIcon(FontAwesomeIcons.upload),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet(
                  context,
                  () => takePhoto(ImageSource.camera),
                  () => takePhoto(ImageSource.gallery))),
            );
          },
        ),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () async {
            final isValid = formKey.currentState!
                .validate(); // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();
              try {
                await FirestoreService().uploadImage(_imageFile!);
                await FirestoreService().uploadProduct(Product(
                  price: price,
                  description: description,
                  image: _imageFile!.name,
                  name: name,
                ));
              } catch (e) {
                print(e);
              }
              final message = 'Producto Añadido';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
