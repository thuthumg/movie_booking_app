import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String assetPath; // the asset video file path
// //  VideoPlayerScreen({required Key key, required this.assetPath}) : super(key: key);
// VideoPlayerScreen(this.assetPath);
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   // initialize the VideoPlayerController and FlickManager
//   late VideoPlayerController _controller;
//   late FlickManager _flickManager;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadVideo();
//   }
//
//   // load the video from assets folder
//   Future<void> _loadVideo() async {
//     final data = await rootBundle.load(widget.assetPath);
//     final bytes = data.buffer.asUint8List();
//     _controller = VideoPlayerController.value(
//       VideoPlayerController.memory(bytes).value,
//     );
//     _flickManager = FlickManager(
//       videoPlayerController: _controller,
//     );
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _flickManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_flickManager == null) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Video Player'),
//         ),
//         body: Center(
//           child: FlickVideoPlayer(
//             flickManager: _flickManager,
//             preferredDeviceOrientationFullscreen: [
//               DeviceOrientation.landscapeLeft,
//               DeviceOrientation.landscapeRight,
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }