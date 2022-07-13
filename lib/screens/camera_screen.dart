import 'package:camera/camera.dart';
import 'package:firebase_testv2/main.dart';
import 'package:firebase_testv2/widgets/cameraViewPage.dart';
import 'package:firebase_testv2/widgets/custom_page_route.dart';
import 'package:firebase_testv2/widgets/videoViewPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  Color videoRecorderButtonColor = Colors.white;
  double videoRecorderButtonSize = 50;
  bool isRecording = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  double _baseZoomScale = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentZoomScale = 1.0;
  int _pointers = 0;

  void _handleScaleStart(ScaleStartDetails details) {
    _baseZoomScale = _currentZoomScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    if (_maxAvailableZoom != await _cameraController.getMaxZoomLevel()) {
      _maxAvailableZoom = await _cameraController.getMaxZoomLevel();
    }
    if (_pointers != 2) {
      return;
    }
    _currentZoomScale = (_baseZoomScale * details.scale).clamp(1.0, _maxAvailableZoom);
    await _cameraController.setZoomLevel(_currentZoomScale);
  }

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
    );
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Listener(
                      onPointerDown: (_) => _pointers++,
                      onPointerUp: (_) => _pointers--,
                      child: GestureDetector(
                        onScaleStart: _handleScaleStart,
                        onScaleUpdate: _handleScaleUpdate,
                        child: CameraPreview(_cameraController),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.bolt,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isFlashOn = !isFlashOn;
                            isFlashOn
                                ? _cameraController.setFlashMode(FlashMode.off)
                                : _cameraController.setFlashMode(FlashMode.torch);
                          });
                        },
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          await startRecording();
                        },
                        onLongPressUp: () async {
                          await stopRecording();
                        },
                        onTap: () async {
                          if (!isRecording) {
                            await takePhoto();
                          }
                        },
                        child: FaIcon(
                          FontAwesomeIcons.circle,
                          color: videoRecorderButtonColor,
                          size: videoRecorderButtonSize,
                        ),
                      ),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.cameraRotate,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          () async => await _cameraController.dispose();
                          setState(() {
                            if (!isFrontCamera) {
                              _cameraController = CameraController(
                                cameras[1],
                                ResolutionPreset.max,
                              );
                              _cameraController.initialize();
                              isFrontCamera = true;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Mantener para grabar video",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.80, -0.90),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto() async {
    late final String path;
    try {
      await _cameraController.takePicture().then((xFile) => path = xFile.path);
      Navigator.push(
        context,
        CustomPageRoute(child: CameraViewPage(path: path)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> startRecording() async {
    setState(() {
      videoRecorderButtonColor = Colors.red;
      videoRecorderButtonSize = 65;
      isRecording = true;
    });
    await _cameraController.startVideoRecording();
  }

  Future<void> stopRecording() async {
    late final String path;
    setState(() {
      videoRecorderButtonColor = Colors.white;
      videoRecorderButtonSize = 50;
      isRecording = false;
    });
    await _cameraController.stopVideoRecording().then((xFile) => path = xFile.path);
    Navigator.push(
      context,
      CustomPageRoute(child: VideoViewPage(path: path)),
    );
  }
}
