import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';
import 'package:bangunmotor/services/googlesignin.dart';

import 'home_screen.dart';
import 'register_screen.dart';
import 'misc/qrsignup_screen.dart';
import 'misc/qrsignupfast_screen.dart';

/****/

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => new _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
	TextEditingController _emailController = new TextEditingController();
	TextEditingController _passwordController = new TextEditingController();
	FocusNode _emailFocusNode = new FocusNode();
	FocusNode _passFocusNode = new FocusNode();
	String _email, _password;
	bool _loading = false;
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	Screen size;


	@override
	void initState(){
		super.initState();
	}

	/****/


	



	/****/

	@override
	Widget build(BuildContext context){
		size = Screen(MediaQuery.of(context).size);
		TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

		final _emailWidget = BoxField(
			controller: _emailController,
			focusNode: _emailFocusNode,
			hintText: "Enter email",
			lableText: "Email",
			obscureText: false,
			onSaved: (String val) {
				_email = val;
			},
			onFieldSubmitted: (String value) {
				FocusScope.of(context).requestFocus(_passFocusNode);
			},
			icon: Icons.email,
			iconColor: Colors.blue.shade400
		);

		final _passwordWidget = BoxField(
			controller: _passwordController,
			focusNode: _passFocusNode,
			hintText: "Enter Password",
			lableText: "Password",
			obscureText: true,
			icon: Icons.lock_outline,
			onSaved: (String val) {
				_password = val;
			},
			iconColor: Colors.blue.shade400
		);

		final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
            	LocalStorage.sharedInstance.writeValue(key:Constants.isLoggedIn,value: "1");
            	Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );


		final googleButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.red.shade400,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {

            	setState((){
            		_loading = true;
            	});

            	print("hey google!");
          		googleHandleSignIn()
				    .then((FirebaseUser user){
				    	print(user);
						LocalStorage.sharedInstance.writeValue(key:Constants.isLoggedIn,value: "Master");
				    	Navigator.of(context).push(
				    		MaterialPageRoute( builder: (context) => HomeScreen()),
			    		);
				    })
				    .catchError((e){
				    	setState((){
		            		_loading = false;
		            	});
				    	print("OOPS!");
				    	print(e);
				    });
            
            },
            child: Text("Login With Google",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );        


		return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				// title: Text("Login", style:
				// 	TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)
				// ),
				backgroundColor: Colors.white,
				actions: <Widget>[
					GestureDetector(
						onTap: (){
							Navigator.push(context, MaterialPageRoute(builder: (context) => QrSignupFastScreen()));
						},
						child: Center(
						    child: Text(
						        "Register ",
						        textScaleFactor: 1.5,
						        style: new TextStyle(
						        	fontSize: 12.0,
						        	color: Colors.blue.shade400,
						        )
						    ),
						)
					)
				],
	            elevation: 0.0,
			),
			resizeToAvoidBottomPadding: false,
			body: Center(
				child: Container(
					color: Colors.white,
					child: Padding(
						padding: const EdgeInsets.all(36.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							// mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								SizedBox(
									height: 120.0,
									child: Image.asset(
										"assets/images/ufo.png",
										fit: BoxFit.contain,
									),
								),
								SizedBox(height: 45.0),
								_emailWidget,
								SizedBox(height: 25.0),
								_passwordWidget,
								SizedBox(
									height: 35.0,
								),
								loginButon,
								SizedBox(
									height: 15.0,
								),
								Center(
									child: Text("or"),
								),
								SizedBox(
									height: 15.0,
								),
								Container(
									child: _loading ? Center(child: CircularProgressIndicator()) : googleButton,
								),
							],
						),
					),
				),
			),
		);

	}


}
