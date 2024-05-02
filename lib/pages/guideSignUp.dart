import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'HomePage.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _documentController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      // Handle the picked image file (e.g., upload to Firebase Storage)
      // You can implement the upload logic here
      print('Image picked: ${pickedFile.path}');
    } else {
      print('No image selected.');
    }
  }

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
      ],
    );
    if (result != null) {
      String? filePath = result.files.single.path;
      print('Document picked: $filePath');
    } else {
      print('No document selected.');
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              TextFormField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'confirm Password',
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Additional details',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Upload Guide Image:',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () {
                  _showImagePickerDialog();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 30.0,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Upload Required Document:',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  _pickDocument();
                },
                child: Container(
                  height: 40,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    Icons.document_scanner,
                    size: 30.0,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: const Text('Create Account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
