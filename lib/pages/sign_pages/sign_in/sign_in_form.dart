import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  final Function(
    String email,
    String paswword,
  ) signIn;
  final String email;
  final String password;
  const SignInForm({
    this.signIn,
    this.email,
    this.password,
  });
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final FocusNode _emailAdresFocus = FocusNode();
  final FocusNode _passwordInpuFocus = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void validate() {
    if (_formkey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  String validatepassword(value) {
    if (value.isEmpty) {
      return "Requiered";
    } else if (value.length < 6) {
      return "Should Be At Least 6 characters";
    } else if (value.length > 15) {
      return "Should Not Be More Than 15 Characters";
    } else if (value != widget.password) {
      return "False Password";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(
          new FocusNode(),
        );
      },
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formkey,
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return Container(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(200),
                      ),
                      _buildAnimation(),
                      SizedBox(
                        height: ScreenUtil().setHeight(80),
                        width: ScreenUtil().setWidth(10),
                      ),
                      // _buildLoginForm(),
                      _buildEmail(),
                      Divider(),
                      _buildPassword(),
                      _buildSignInButton(),
                      _buildForgotPasswordButton(),
                      _buildSignUpButton(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    return Center(
      child: Container(
        height: ScreenUtil().setHeight(400),
        width: ScreenUtil().setWidth(400),
        child: FlareActor(
          "assets/flr/robot-no-data.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "buscando",
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      height: ScreenUtil().setHeight(130),
      width: ScreenUtil().setWidth(530),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          focusNode: _emailAdresFocus,
          onFieldSubmitted: (term) {
            _fieldFocusChange(context, _emailAdresFocus, _passwordInpuFocus);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            errorStyle: TextStyle(fontSize: 15, height: 0.05),
            border: InputBorder.none,
            hintText: "E-mail",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xff4d606f),
              fontSize: ScreenUtil().setSp(32),
            ),
          ),
          validator: (value) {
            if (value != widget.email) {
              return "False Email";
            } else {
              return null;
            }
          }),
    );
  }

  Widget _buildPassword() {
    return Container(
      height: ScreenUtil().setHeight(130),
      width: ScreenUtil().setWidth(530),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        focusNode: _passwordInpuFocus,
        onFieldSubmitted: (value) {
          _passwordInpuFocus.unfocus();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          errorStyle: TextStyle(fontSize: 15, height: 0.05),
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xff4d606f),
            fontSize: ScreenUtil().setSp(32),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.lock : Icons.lock_open,
              color: Color(0xff4d606f),
            ),
            onPressed: () {
              setState(
                () {
                  _obscureText = !_obscureText;
                },
              );
            },
          ),
        ),
        validator: validatepassword,
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: ScreenUtil().setHeight(135),
      width: ScreenUtil().setWidth(530),
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        color: Colors.pink,
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.cyan,
            fontWeight: FontWeight.w900,
            fontSize: ScreenUtil().setSp(32),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          if (_formkey.currentState.validate()) {
            widget.signIn(
              _emailController.text,
              _passwordController.text,
            );
            Keys.navKey.currentState.pushNamed("/home");
          }
        },
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      child: FlatButton(
        onPressed: () {
          Keys.navKey.currentState.pushNamed("/forgot_details");
        },
        child: Text(
          "Forgot your details?",
          style: TextStyle(
            fontFamily: "TitilliumWeb",
            height: 1.3,
            color: Colors.cyan,
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(27),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(top: 90),
      child: FlatButton(
        onPressed: () {
          Keys.navKey.currentState.pushNamed("/sign_up_container");
        },
        child: Text(
          "Create a new account",
          style: TextStyle(
            color: Colors.cyan[50],
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
