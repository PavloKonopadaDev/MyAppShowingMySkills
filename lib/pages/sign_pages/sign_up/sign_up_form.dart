import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flare_flutter/flare_actor.dart';

class SignUpForm extends StatefulWidget {
  final Function(
    String email,
    String name,
    String password,
    String confirmPassword,
  ) signUp;

  const SignUpForm({
    @required this.signUp,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

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
      // } else if (value != widget.password) {
      //   return "False Password";
    } else {
      return null;
    }
  }

  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Container(
                        height: ScreenUtil().setHeight(260),
                        width: ScreenUtil().setWidth(700),
                        child: FlareActor(
                          "assets/flr/programmer_fork.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "coding",
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(60)),
                      _buildName(),
                      Divider(),
                      _buildEmail(),
                      Divider(),
                      _buildPassword(),
                      Divider(),
                      _buildConfirmPassword(),
                      _buildRegestrationButton(),
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

  Widget _buildName() {
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
        controller: _nameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        focusNode: _nameFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _nameFocus, _emailFocus);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          errorStyle: TextStyle(fontSize: 15, height: 0.05),
          border: InputBorder.none,
          hintText: "Enter Your Name",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xff4d606f),
            fontSize: ScreenUtil().setSp(32),
          ),
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
        focusNode: _emailFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _emailFocus, _passwordFocus);
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
      ),
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
        textInputAction: TextInputAction.next,
        focusNode: _passwordFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _passwordFocus, _confirmPasswordFocus);
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

  Widget _buildConfirmPassword() {
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
          controller: _confirmPasswordController,
          obscureText: _obscureText2,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          focusNode: _confirmPasswordFocus,
          onFieldSubmitted: (value) {
            _confirmPasswordFocus.unfocus();
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            errorStyle: TextStyle(fontSize: 15, height: 0.05),
            border: InputBorder.none,
            hintText: "Confirm Password",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xff4d606f),
              fontSize: ScreenUtil().setSp(32),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText2 ? Icons.lock : Icons.lock_open,
                color: Color(0xff4d606f),
              ),
              onPressed: () {
                setState(
                  () {
                    _obscureText2 = !_obscureText2;
                  },
                );
              },
            ),
          ),
          validator: (val) {
            if (val.isEmpty) return 'Empty';
            if (val != _passwordController.text) return 'Not Match';
            return null;
          }),
    );
  }

  Widget _buildRegestrationButton() {
    return Container(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(530),
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        color: Colors.pink,
        child: Text(
          "Regestration",
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
            widget.signUp(
              _nameController.text,
              _emailController.text,
              _passwordController.text,
              _confirmPasswordController.text,
            );
            return Keys.navKey.currentState.pop("/sign_in_container");
          }
        },
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
