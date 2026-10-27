import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({super.key});

  @override
  State<MyFormValidation> createState() => MyFormValidationState();
}

class MyFormValidationState extends State<MyFormValidation> {
  // Inisialisasi GlobalKey untuk Form[cite: 27, 29]
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Inisialisasi TextEditingController[cite: 29]
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();

  @override
  void dispose() {
    // Menghapus controller untuk mencegah memory leak[cite: 29]
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  // Method validasi email menggunakan Regex[cite: 32]
  String? _validateEmail(String? value) {
    const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
        "\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+";
    final RegExp regExp = RegExp(expression);

    if (value!.isEmpty) {
      return 'Email wajib diisi';
    }
    if (!regExp.hasMatch(value)) {
      return 'Tolong inputkan email yang valid!';
    }
    return null;
  }

  // Method validasi nama minimal 3 karakter[cite: 33]
  String? _validateNama(String? value) {
    if (value!.length < 3) {
      return 'Masukkan setidaknya 3 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress, // Memunculkan tanda @ pada keyboard[cite: 31]
                    validator: _validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'Write your email here...',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 255, 249, 222),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerNama,
                    validator: _validateNama,
                    decoration: const InputDecoration(
                      hintText: 'Write your name here...',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 255, 249, 222),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Jika validasi sukses, tampilkan AlertDialog data yang diinput[cite: 34, 35]
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email : ${_controllerEmail.text}'),
                                Text('Nama : ${_controllerNama.text}'),
                              ],
                            ),
                          );
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please complete the form'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}