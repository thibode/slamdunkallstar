import "package:flutter/material.dart";

class CustomDecoration {
  BoxDecoration customBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: const ExactAssetImage('assets/images/720003.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      ),
      color: Colors.white.withOpacity(0.2),
      backgroundBlendMode: BlendMode.dstATop,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }
}
