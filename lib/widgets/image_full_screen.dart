import 'package:flutter/material.dart';
import 'package:phone007/utils/app_colors.dart';

class ImageFullScreen extends StatefulWidget {
  const ImageFullScreen({required this.child});

  final Widget child;

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 333),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4,
                  child: widget.child,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                elevation: 0,
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 25,
                ),
                color: AppColors.white,
                highlightElevation: 0,
                minWidth: double.minPositive,
                height: double.minPositive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
