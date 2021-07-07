import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyttle_app/Screens/signup_screen.dart';
import 'package:wyttle_app/Screens/welcome_screen.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/authserice.dart';
import 'package:wyttle_app/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  late String email;
  late String password;
  late User tempUser;

  final formkey = new GlobalKey<FormState>();

  bool isVisible = true;

  TextEditingController emailController = TextEditingController();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });

    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  checkFields() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  login() async {
    setState(() {
      isLoading = true;
    });
    if (checkFields()) {
      var msg = await AuthService.authenticate(email, password);
      if (msg == "Sign in successfull") {
        showInSnackBar(context, msg, 1000);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      } else {
        showInSnackBar(context, msg, 1000);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 48.0, left: 32.0, right: 32.0, bottom: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                headingWidget(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                logoWidget(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                formWidget(context),
                SizedBox(height: 32),
                (!isLoading)
                    ? buttonWidget(context)
                    : CircularProgressIndicator(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                sigupswitch(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sigupswitch(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "New User? Sign up now!",
          style: GoogleFonts.nunito(
            color: Color(0xffA09898),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget headingWidget(BuildContext context) {
    return Text(
      "Login to continue",
      style: GoogleFonts.nunito(
        color: Colors.cyan,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget logoWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/Group 1.png",
        height: 150,
      ),
    );
  }

  Widget buttonWidget(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      minWidth: 360,
      height: 55,
      color: Colors.cyan.shade700,
      onPressed: () async {
        await login();
      },
      child: Text(
        "Login",
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget formWidget(BuildContext context) {
    return Container(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formheaderWidget(context, 'Email Id'),
            SizedBox(
              height: 8,
            ),
            inputEmailWidget(emailController, "Please Enter your Email", false,
                (value) {
              email = value;
            }),
            SizedBox(
              height: 16,
            ),
            formheaderWidget(context, 'Password'),
            SizedBox(
              height: 8,
            ),
            inputPasswordlWidget(
                passwordController, "Please Enter your Password", true,
                (value) {
              password = value;
            }),
          ],
        ),
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

  Widget inputEmailWidget(TextEditingController textEditingController,
      String validation, bool, save) {
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
        obscureText: bool,
        validator: (value) => value!.isEmpty ? validation : null,
        onSaved: save,
      ),
    );
  }

  Widget inputPasswordlWidget(TextEditingController textEditingController,
      String validation, bool, save) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isVisible,
        decoration: new InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                !isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: ""),
        validator: (value) => value!.isEmpty ? validation : null,
        onSaved: save,
      ),
    );
  }
}
