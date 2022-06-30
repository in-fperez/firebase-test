import 'package:firebase_testv2/services/firestore.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:firebase_testv2/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = GlobalKey<FormState>();
  double price = 0.0;
  String description = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Añadir Producto'),
        ),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildUsername(),
              const SizedBox(height: 16),
              buildEmail(),
              const SizedBox(height: 32),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildUsername() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Precio',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
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

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () async {
            final isValid = formKey.currentState!
                .validate(); // FocusScope.of(context).unfocus();

            if (isValid) {
              await FirestoreService().uploadProduct(Product(
                  price: price,
                  description: description,
                  image: '0-367x267.jpg',
                  name: 'product_60'));

              final message = 'Añadido';
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
}
