import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wyttle_app/Screens/welcome_screen.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:wyttle_app/widgets/snackbar.dart';

import 'landing_screen.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool loading = false;
  bool loader = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      loader = true;
    });
    user = await UserService.getUser();
    uploadDp(File("assets/images/signup.png"), user.id);
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.grey[200],
                        child: Image.asset("assets/images/signup.png"),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: formWidget(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  final cloudinary = Cloudinary(
      "983243294238266", "OW1V-T4xY90L4eoC3MHS_GprG60", "sambitraze");

  uploadDp(File file, String id) async {
    final response = await cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: file.path,
        resourceType: CloudinaryResourceType.image,
        folder: "userDp",
        fileName: '$id',
      ),
    );
    if (response.isSuccessful) {
      setState(() {
        photoUrlController.text = response.secureUrl!;
        user.photoUrl = response.secureUrl!;
      });
    }
    return response.isSuccessful;
  }

  final picker = ImagePicker();
  late User user;

  Future compress(
    img,
  ) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    final result = await FlutterImageCompress.compressAndGetFile(
      img.path,
      path.join(dir, user.id.toString() + ".png"),
      format: CompressFormat.png,
      quality: 40,
    );
    return result;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File img = await compress(pickedFile);
      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.grey.shade100,
              content: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: FileImage(img),
              ),
              actions: [
                MaterialButton(
                  onPressed: () async {
                    bool res = await uploadDp(img, user.id);
                    if (res) {
                      imageCache!.clear();
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Profile picture updated."),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Profile picture not updated."),
                        ),
                      );
                    }
                  },
                  child: Text("Update"),
                )
              ],
            );
          },
        ),
      );
    } else {
      print('No image selected.');
    }
  }

  final formkey = new GlobalKey<FormState>();
  Widget formWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Add Data",
                style: GoogleFonts.nunito(
                  color: Colors.cyan,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () async {
                  await getImage();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      placeholder: "assets/images/loader.gif",
                      image: user.photoUrl,
                    ),
                  ),
                ),
              ),
              formheaderWidget(context, 'Phone'),
              inputWidget(
                phoneController,
                "Enter your Phone No",
              ),
              SizedBox(
                height: 18,
              ),
              formheaderWidget(context, 'Address'),
              inputWidget(
                addressController,
                "Enter your Address",
              ),
              SizedBox(
                height: 40,
              ),
              buttonWidget(
                context,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          )),
    );
  }

  check() {
    return true;
  }

  Widget buttonWidget(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minWidth: 360,
            height: 55,
            color: Colors.cyan.shade700,
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                setState(() {
                  user.phone = phoneController.text;
                  user.address = addressController.text;
                  user.photoUrl = photoUrlController.text;
                });
                print(user.toJson());
                bool updated =
                    await UserService.updateUser(jsonEncode(user.toJson()));
                if (updated) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LandingScreen(),
                    ),
                  );
                } else {
                  showInSnackBar(context, "Update Failed", 1500);
                }
                print(updated);
              } else {
                SnackBar(
                  content: Text("Check all fields"),
                  duration: Duration(milliseconds: 800),
                );
              }
            },
            child: Text(
              "Sign Up",
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          );
  }

  Widget formheaderWidget(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.nunito(
          color: Color(0xffA09898), fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget inputWidget(
      TextEditingController textEditingController, String validation) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: ""),
        validator: (value) => value!.isEmpty ? validation : null,
      ),
    );
  }
}
