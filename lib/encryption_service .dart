import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart';
import 'package:dbcrypt/dbcrypt.dart';

class EncryptionService {
  String? _plainEmail;
  encrypt.IV? iv;
  String? stringKey;
  String? _requestKey;
  encrypt.Encrypter? encrypter;
  encrypt.Encrypted? encrypted;

  static EncryptionService shared = EncryptionService.internal();

  EncryptionService.internal();

  void config({
    String? plainEmail,
    String? plainPassword,
    String? requestKey,
  }) {
    this._plainEmail = plainEmail;
    this._requestKey = requestKey;

    encrypt.Key? key;

    if (_requestKey == null && plainEmail != null && plainPassword != null) {
      stringKey = DBCrypt().hashpw(
        plainPassword,
        DBCrypt().gensaltWithRounds(10),
      );

      final bytes = utf8.encode(stringKey! + plainEmail);
      final Digest sha256Key = sha256.convert(bytes);

      key = encrypt.Key(Uint8List.fromList(sha256Key.bytes));

      iv = encrypt.IV.fromSecureRandom(16);
    }
    encrypter = encrypt.Encrypter(
      encrypt.AES(
        _requestKey != null ? encrypt.Key.fromBase64(_requestKey!) : key!,
        mode: encrypt.AESMode.ctr,
        padding: null,
      ),
    );
    if (_requestKey == null && plainPassword != null) {
      encrypted = encrypter!.encrypt(plainPassword, iv: iv);
    }
  }

  String getEncryptedBase64Password() {
    return encrypted!.base64;
  }

  String getDecryptedBase64({
    String? encryptedString,
    String? requestIV,
  }) {
    return encrypter!.decrypt(
      encrypt.Encrypted.fromBase64(encryptedString!),
      iv: requestIV == null ? iv : encrypt.IV.fromBase16(requestIV),
    );
  }

  String getBcryptedPassword() {
    return stringKey!;
  }

  String getBase16IV() {
    return iv!.base16;
  }

  String getPlainEmail() {
    return _plainEmail!;
  }

  String getRequestKey() {
    return _requestKey!;
  }

  String encryptDataBase64(dynamic data) {
    iv = encrypt.IV.fromSecureRandom(16);
    encrypted = encrypter!.encrypt(data.toString(), iv: iv);
    return encrypted!.base64;
  }
}
