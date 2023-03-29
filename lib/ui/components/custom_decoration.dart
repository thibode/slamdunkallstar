import "package:flutter/material.dart";

class customDecoration {
  BoxDecoration customBackground() {
    return BoxDecoration(
      image: new DecorationImage(
        image: new ExactAssetImage('assets/images/720003.jpg'),
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.dstATop),
      ),
      color: Colors.white.withOpacity(0.2),
      backgroundBlendMode: BlendMode.dstATop,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 20,
          offset: Offset(0, 10),
        ),
      ],
    );
  }
}
