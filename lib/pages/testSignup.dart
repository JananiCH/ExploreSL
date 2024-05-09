/*import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploresl_login/pages/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _languagesController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _additionalDetailsController = TextEditingController();

  File? profileImage;

  String get name => _nameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  String get document => _documentController.text;
  String get dob => _dobController.text;
  String get languages => _experienceController.text;
  String get experience => _languagesController.text;
  String get phoneNumber => _phoneNumberController.text;
  String get additionalDetails => _additionalDetailsController.text;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _dobController.dispose();
    _experienceController.dispose();
    _languagesController.dispose();
    _documentController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _additionalDetailsController.dispose();
    super.dispose();
  }

  Future<void> signUpGuide() async {
    try {
      final uid = await signInUser(email, password);
      String imageDownloadUrl = "";

      if (profileImage != null) {
        imageDownloadUrl = await uploadProfileImage(profileImage!, uid);
      }

      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'DOB': dob,
        'experience': experience,
        'languages': languages,
        'document': document,
        'phoneNumber': phoneNumber,
        'image': imageDownloadUrl,
        'type': 'guide',
        'additionalDetails': additionalDetails,
      });
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInUser(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user == null) {
        throw Exception("User not found");
      }
      return user.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadProfileImage(File image, String uid) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('user/$uid/profile.png');
      UploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.whenComplete(() {});
      final downloadUrl = storageReference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() => profileImage = File(pickedFile.path));
      }
    } catch (e) {
      rethrow;
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
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('users/doc/${DateTime.now()}.pdf');
      // Upload the file to firebase
      UploadTask uploadTask =
          storageReference.putFile(File(result.files.single.path!));
      await uploadTask.whenComplete(() {
        print('document uploaded to firebase');
      });

      String getDownloadURL = await storageReference.getDownloadURL();

      // Set the image URL to the _addImageController
      _documentController.text = getDownloadURL;
    } else {
      print('no document selected');
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
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'DOB',
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                controller: _languagesController,
                decoration: const InputDecoration(
                  labelText: 'languages',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Additional details',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _additionalDetailsController,
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
              InkWell(
                onTap: () => _showImagePickerDialog(),
                child: profileImage != null
                    ? Center(
                        child: ClipOval(
                          child: Image.file(
                            profileImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
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
              GestureDetector(
                onTap: () async {
                  signUpGuide().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/