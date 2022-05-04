import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingOverlayWidget({
    Key? key,
    this.isLoading = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: Colors.black,
      opacity: 0.6,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.red,
      ),
      child: child,
    );
  }
}
