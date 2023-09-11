
class FileInfo {
  final String fileName;
  final String fileUrl;
  final double progress;

  const FileInfo({
    required this.fileName,
    required this.fileUrl,
    required this.progress,
  });

  FileInfo copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
  }) =>
      FileInfo(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
      );
}

List<FileInfo> filesData = [
  const FileInfo(
    fileName: "PythonBook",
    fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    progress: 0.0,
  ),
  const FileInfo(
    progress: 0.0,
    fileName: "Butterfly",
    fileUrl:
        "https://images.all-free-download.com/footage_preview/mp4/closeup_of_wild_butterfly_in_nature_6891908.mp4",
  ),
  const FileInfo(
    progress: 0.0,
    fileName: "Sabyan ya Rohman",
    fileUrl:
        "https://muzzona.kz/upload/files/2020-12/sabyan-gambus-rohman-ya-rohman_(muzzona.kz).mp3",
  ),
  const FileInfo(
    progress: 0.0,
    fileName: "ajotyib rasm",
    fileUrl:
        "https://odam.uz/upload/media/posts/2019-10/21/mashhur-suratkash-ajoyib-rasm-olish-sirlarini-oshkor-qildi_1571694997-b.jpg",
  ),
  const FileInfo(
    progress: 0.0,
    fileName: "Foydali file",
    fileUrl:
        "https://foydali-fayllar.uz/wp-content/uploads/2021/04/informatika-test.doc.zip",
  ),
];
