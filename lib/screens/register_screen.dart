import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import './home_screen.dart';

class RegisterScreen extends StatefulWidget {
	RegisterScreen({Key key}) : super(key: key);

	@override
	_RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	bool _agreedToTOS = true;
	Screen size;
	String _phone, _smsCode;
	String _verificationId;


	/****/

	bool _submittable() {
		return _agreedToTOS;
	}

	void _submit() {
		if(_formKey.currentState.validate()){
			_formKey.currentState.save();
			print('Form submitted');
			verifyPhone();
		} else{
			print("invalid form");
		}
	}

	void _setAgreedToTOS(bool newValue) {
		setState(() {
			_agreedToTOS = newValue;
		});
	}

	/****/

	Future<void> verifyPhone() async {
		final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
			this._verificationId = verId;
		};

		final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
			this._verificationId = verId;
			smsCodeDialog(context).then((value) {
				print('sms sent');
				print(value);
			});
		};

		final PhoneVerificationCompleted verifiedSuccess = (AuthCredential phoneAuthCredential) async{
			print('verified');
			print(phoneAuthCredential.toString());
			await loginWithPhoneNumber(phoneAuthCredential);
		};

		final PhoneVerificationFailed veriFailed = (AuthException exception) {
			print('${exception.message}');
		};

		await FirebaseAuth.instance.verifyPhoneNumber(
			phoneNumber: _phone,
			codeAutoRetrievalTimeout: autoRetrieve,
			codeSent: smsCodeSent,
			timeout: const Duration(seconds: 5),
			verificationCompleted: verifiedSuccess,
			verificationFailed: veriFailed
		);
	}


	Future<bool> smsCodeDialog(BuildContext context) {
		return showDialog(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context) {
				return new AlertDialog(
					title: Text('Enter sms Code'),
					content: TextField(
						keyboardType: TextInputType.number,
						onChanged: (value) {
							_smsCode = value;
						},
					),
					contentPadding: EdgeInsets.all(10.0),
					actions: <Widget>[
					new FlatButton(
						child: Text('Done'),
						onPressed: () {
							FirebaseAuth.instance.currentUser().then((user) {
								if (user != null) {
									print("sms A sukses");
									print(user);
									Navigator.of(context).pop();
									// Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
								} else {
									Navigator.of(context).pop();
									signIn();
								}
							});
						},
					)
				],
				);
			}
		);
	}


	signIn() async{
		final AuthCredential credential = PhoneAuthProvider.getCredential(
			verificationId: _verificationId,
			smsCode: _smsCode,
		);

		FirebaseAuth _auth = FirebaseAuth.instance;
		final FirebaseUser user =
		await _auth.signInWithCredential(credential).then((user) {
			print("sms B sukses");
			print(user);
			// Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
		}).catchError((e) {
			print(e);
		});
	}


	static Future<FirebaseUser> loginWithPhoneNumber(AuthCredential authCredential) async {
		FirebaseUser user;
		try{
			user = (await FirebaseAuth.instance.signInWithCredential(authCredential)).user;
		}
		catch(e){
			print (e.toString());
		}

		return user;
	}

	/****/


	@override
	Widget build(BuildContext context){
		size = Screen(MediaQuery.of(context).size);
		TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

		final _getFormUI = Column(
			children: [

				SizedBox(height: 10.0),

				TextFormField(
					keyboardType: TextInputType.phone,
					autofocus: false,
					decoration: InputDecoration(
						hintText: 'Phone Number',
						contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
						border:
						OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
					),
					validator: (String value){
						if(value.trim().isEmpty){
							return "Phone Number Required";
						}
					},
					onSaved: (String value) {
						print(value);
						setState(() => _phone = value);
					},
				),

				Padding(
					padding: EdgeInsets.symmetric(vertical: 16.0),
					child: Material(
						elevation: 5.0,
						borderRadius: BorderRadius.circular(30.0),
						color: Color(0xff01A0C7),
						child: MaterialButton(
							minWidth: MediaQuery.of(context).size.width,
							padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
							onPressed: () {
								_submit();
							},
							child: Text("Submit",
								textAlign: TextAlign.center,
								style: style.copyWith(
									color: Colors.white, fontWeight: FontWeight.bold)
								),
							),
						)
		        ),

			],
		);

		/****/

		return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				title: Text("Register", style:
					TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)
				),
				backgroundColor: Colors.blue.shade400,
			),
			body: Container(
				child: new SingleChildScrollView(
					child: new Container(
						margin: new EdgeInsets.all(20.0),
						child: Center(
							child: new Form(
								key: _formKey,
								child: _getFormUI,
							),
						),
					),
				),
			),
		);

	}


}
