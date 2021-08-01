import 'package:firebase_auth/firebase_auth.dart';

class SharedResources {
  static final Map<String, bool> genderMap = {
    "Woman": false,
    "Man": false,
    "Agender": false,
    "Androgynous": false,
    "Bigender": false,
    "Genderfluid": false,
    "Genderqueer": false,
    "Gender Nonconforming": false,
    "Hijra": false,
    "Intersex": false,
    "Non-binary": false,
    "Pangender": false,
    "Transfeminine": false,
    "Transgender": false,
    "Trans Man": false,
    "Transmasculine": false,
    "Transsexual": false,
    "Trans Woman": false,
    "Two Spirit": false,
    "Other gender": false,
  };

  static User getCurrentUser() => FirebaseAuth.instance.currentUser;
}
