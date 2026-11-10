import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  try {
    // 1. Web Client ID que obtuviste en Google Cloud Console
    const webClientId = 'TU_WEB_CLIENT_ID.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);

    // 2. Abre la ventana de selección de cuenta de Google
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return; // El usuario canceló el inicio de sesión
    }

    // 3. Extrae los tokens de autenticación de Google
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw 'No se pudieron obtener los tokens de Google.';
    }

    // 4. Envía las credenciales a Supabase para iniciar sesión o registrar al usuario
    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  } catch (e) {
    print('Error al iniciar sesión con Google: $e');
  }
}

final supabase = Supabase.instance.client;

Future<List<Map<String, dynamic>>> getProducts(String category) async {
  return await supabase.from('products').select().eq('category', category);
}
