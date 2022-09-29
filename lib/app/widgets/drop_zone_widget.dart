import 'dart:html' as html;
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/overlay_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/util/file_util.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/overlay/overlay_loading.dart';
import 'package:image_whisperer/image_whisperer.dart';

class DropFileWidget extends StatefulWidget {
  final ValueChanged<ProcessImgElement> onDroppedFile;
  const DropFileWidget({
    Key? key,
    required this.onDroppedFile,
  }) : super(key: key);
  @override
  State<DropFileWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropFileWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: onDropFile,
            onHover: () => setState(() => highlight = true),
            onLeave: () => setState(() => highlight = false),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () async {

                FilePickerResult? res = await FilePicker.platform.pickFiles();
                if (res != null) {
                  PlatformFile file = res.files.first;
                  await onPickFile(file);
                }

              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.layers,
                      size: 110,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: MediaQuery.of(context).size.width < 350
                                ? 15
                                : 35.0,
                          ),
                        ),
                        onPressed: () async {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MediaQuery.of(context).size.width < 350
                                ? const SizedBox()
                                : const Padding(
                                    padding: EdgeInsets.only(right: 7.5),
                                    child: Icon(
                                      Icons.upload,
                                    ),
                                  ),
                            const Flexible(
                              child: Text(
                                "Upload Image",
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                style: TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Or drag and drop a file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onPickFile(PlatformFile file) async {
    final imgElement = html.ImageElement(src: file.path);
    final processImg = ProcessImg(
            createdAt: DateTime.now(),
            fileLastModifiedDate: null,
            fileName: file.name,
            fileSize: file.size,
            beforeImg: file.bytes,
            isValidMedia: true, // Pre assume true
          );
    final processImgElement = ProcessImgElement(
      imgElement: imgElement,
      processImg: processImg,
    );
    await AppSer().dbSer().imgDBSer().write(img: processImg);
    widget.onDroppedFile(processImgElement);
    await OverlaySer().removeOverlay('loadingOverlay');
  }

  

  Future<void> onDropFile(dynamic event) async {
      await showOverlayLoading(context: context);
      late ProcessImgElement processImgElement;
      late ProcessImg processImg;
      html.ImageElement? imgElement;
      Uint8List? uint8list;
      html.File file = event;
      DateTime? lastModifiedDate = file.lastModifiedDate;
      String fileName = file.name;
      int fileSize = file.size;
      final url = await controller.createFileUrl(event);
      final fileMine = await controller.getFileMIME(event);
      final isFileValid = FileUtil().isAllowedImgType(fileMine);
      if (isFileValid) {
        var blob = BlobImage(file, name: file.name).blob;
        var r = html.FileReader();
        r.readAsArrayBuffer(blob);
        r.onLoad.listen((e) {
          var data = r.result;
          uint8list = data as Uint8List?;
          processImg = ProcessImg(
            createdAt: DateTime.now(),
            fileLastModifiedDate: lastModifiedDate,
            fileName: fileName,
            fileSize: fileSize,
            beforeImg: isFileValid ? uint8list! : null,
            isValidMedia: isFileValid,
          );
        });
        imgElement = html.ImageElement(src: url);
        imgElement.onLoad.first.then((element) async {
          processImgElement = ProcessImgElement(
            imgElement: isFileValid ? imgElement : null,
            processImg: processImg,
          );
          await AppSer().dbSer().imgDBSer().write(img: processImg);
          widget.onDroppedFile(processImgElement);
          await OverlaySer().removeOverlay('loadingOverlay');
        });
      } else {
        processImg = ProcessImg(
          createdAt: DateTime.now(),
          fileLastModifiedDate: lastModifiedDate,
          fileName: fileName,
          fileSize: fileSize,
          isValidMedia: false,
        );
        final processImgElement = ProcessImgElement(
          imgElement: null,
          processImg: processImg,
        );
        await AppSer().dbSer().imgDBSer().write(img: processImg);
        widget.onDroppedFile(processImgElement);
        await OverlaySer().removeOverlay('loadingOverlay');
      }
    
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.amber : Colors.white;
    return Card(
      color: colorBackground,
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
