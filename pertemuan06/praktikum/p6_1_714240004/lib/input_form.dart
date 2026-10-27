import 'package:flutter/material.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key});

  @override
  State<MyInputForm> createState() => MyInputFormState();
}

class MyInputFormState extends State<MyInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();

  // Deklarasi Map untuk menampung data list[cite: 37]
  final List<Map<String, dynamic>> _myDataList = [];
  
  // Variabel untuk melacak data yang sedang diedit[cite: 40]
  Map<String, dynamic>? editedData;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

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

  String? _validateNama(String? value) {
    if (value!.length < 3) {
      return 'Masukkan setidaknya 3 karakter';
    }
    return null;
  }

  // Method untuk menambah atau memperbarui data[cite: 38, 41]
  void _addData() {
    final data = {
      'name': _controllerNama.text,
      'email': _controllerEmail.text,
    };
    setState(() {
      if (editedData != null) {
        editedData!['name'] = data['name'];
        editedData!['email'] = data['email'];
        editedData = null; // Reset setelah edit selesai[cite: 41]
      } else {
        _myDataList.add(data);
      }
      _controllerNama.clear();
      _controllerEmail.clear();
    });
  }

  // Method untuk memuat data ke form saat tombol edit diklik[cite: 39, 41]
  void _editData(Map<String, dynamic> data) {
    setState(() {
      _controllerEmail.text = data['email'];
      _controllerNama.text = data['name'];
      editedData = data;
    });
  }

  // Method konfirmasi dialog untuk menghapus data[cite: 42]
  void _deleteData(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _myDataList.remove(data);
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Membungkus Form dengan SingleChildScrollView agar tidak overflow
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
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
                        child: Text(editedData != null ? "Update" : "Submit"), // Berubah dinamis jadi Update/Submit[cite: 41]
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _addData();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'List Data',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Menggunakan Expanded pada ListView agar bagian list saja yang dapat di-scroll[cite: 40]
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _myDataList.length,
                itemBuilder: (context, index) {
                  final data = _myDataList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(
                            'ULBI',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['name'] ?? ''),
                              Text(data['email'] ?? ''),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _editData(data);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteData(data); // Memanggil dialog konfirmasi hapus
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}