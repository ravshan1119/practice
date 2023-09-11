
import 'package:flutter/material.dart';
import 'package:practice/models/file_info.dart';
import 'package:practice/widgets/single_file_download.dart';

class FileDownloadExample extends StatefulWidget {
  const FileDownloadExample({Key? key}) : super(key: key);

  @override
  State<FileDownloadExample> createState() => _FileDownloadExampleState();
}

class _FileDownloadExampleState extends State<FileDownloadExample> {
  int doublePress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File download example one"),
      ),
      body: ListView(
        children: List.generate(filesData.length, (index) {
          var singleFile = filesData[index];
          return SingleFileDownload(fileInfo: singleFile);
        }),
      ),
    );
  }
}
