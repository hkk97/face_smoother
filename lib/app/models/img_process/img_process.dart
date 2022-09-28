import 'package:flutter/foundation.dart';

class ProcessImg {
  final Uint8List? beforeImg;
  final Uint8List? afterImg;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? fileLastModifiedDate;
  final String fileName;
  final int? fileSize;
  final bool isValidMedia;
  final bool isExample;

  ProcessImg.example({
    this.beforeImg,
    this.afterImg,
    required this.createdAt,
    this.updatedAt,
    this.fileLastModifiedDate,
    this.fileName = 'Example',
    required this.fileSize,
    this.isExample = true,
    this.isValidMedia = true,
  });

  ProcessImg({
    this.beforeImg,
    this.afterImg,
    required this.createdAt,
    this.updatedAt,
    required this.fileLastModifiedDate,
    required this.fileName,
    this.fileSize,
    this.isExample = false,
    required this.isValidMedia,
  });

  factory ProcessImg.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProcessImg(
      beforeImg: json['beforeImg'] != null || json['beforeImg'] != ''
          ? Uint8List.fromList(List<int>.from(json['beforeImg']))
          : null,
      afterImg: json['afterImg'] != null || json['afterImg'] != ''
          ? Uint8List.fromList(List<int>.from(json['afterImg']))
          : null,
      updatedAt: json['updatedAt'] != '' && json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      fileLastModifiedDate: DateTime.parse(json['fileLastModifiedDate']),
      fileName: json['fileName'],
      fileSize: json['fileSize'],
      isExample: json['isExample'],
      isValidMedia: json['isValidMedia'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'beforeImg': beforeImg == null || beforeImg!.isEmpty ? '' : beforeImg,
      'afterImg': afterImg == null || afterImg!.isEmpty ? '' : afterImg,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt == null ? '' : updatedAt!.toIso8601String(),
      'fileLastModifiedDate': fileLastModifiedDate!.toIso8601String(),
      'fileName': fileName,
      'fileSize': fileSize,
      'isExample': isExample,
      'isValidMedia': isValidMedia,
    };
  }

  ProcessImg copyWith(
    Uint8List? afterImg,
  ) =>
      ProcessImg(
        beforeImg: beforeImg,
        afterImg: afterImg ?? this.afterImg,
        createdAt: createdAt,
        updatedAt: DateTime.now(),
        fileLastModifiedDate: fileLastModifiedDate,
        fileName: fileName,
        fileSize: fileSize,
        isExample: isExample,
        isValidMedia: isValidMedia,
      );
}
