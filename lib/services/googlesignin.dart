import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

/****/

Future<FirebaseUser> googleHandleSignIn() async {
	final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
	final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

	final AuthCredential credential = GoogleAuthProvider.getCredential(
		accessToken: googleAuth.accessToken,
		idToken: googleAuth.idToken,
		);

	final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
	print("signed in " + user.displayName);

	return user;
}


void googleHandleSignOut() async{
	await _googleSignIn.signOut();

	print("User Sign Out");
}
