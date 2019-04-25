import 'dart:async';
import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_storage/firebase_storage.dart';

class StorageIO {
  /// creating a static instance of class
  static StorageIO _storageIO = StorageIO._createInstance();

  /// creates a instance of class
  StorageIO._createInstance();

  /// singleton instance of class
  factory StorageIO() => _storageIO;

  /// downloads image file into temp directory with location as file name and returns file location in temp directory
  Future<File> downloadImage(String location) async {
    print('Downloading image with location: $location');
    final Directory tempDir = Directory.systemTemp;
    final File file = File('${tempDir.path}/$location');

    final StorageReference ref = FirebaseStorage.instance.ref().child('Images/$location');
    final StorageFileDownloadTask task = ref.writeToFile(file);
    final int fileSize = (await task.future).totalByteCount;
    print('Downloaded image of size: $fileSize');

    return file;
  }

  /// downloads song file into temp directory with location as file name and returns file location in temp directory
  Future<File> downloadSong(String location) async {
    print('Downloading Song with location: $location');
    final Directory tempDir = Directory.systemTemp;
    final File file = File('${tempDir.path}/$location');

    final StorageReference ref = FirebaseStorage.instance.ref().child('Songs/$location');
    final StorageFileDownloadTask task = ref.writeToFile(file);
    final int fileSize = (await task.future).totalByteCount;
    print('Downloaded song of size: $fileSize');

    return file;
  }
}