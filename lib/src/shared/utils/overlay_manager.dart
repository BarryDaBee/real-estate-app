import 'package:flutter/material.dart';

class OverlayManager {
  final List<OverlayEntry> _entries = [];

  void addOverlay(OverlayState overlayState, OverlayEntry entry) {
    overlayState.insert(entry);
    _entries.add(entry);
    _updatePositions();
  }

  void removeOverlay(OverlayEntry entry) {
    entry.remove();
    _entries.remove(entry);
    _updatePositions();
  }

  void removeAllOverlays() {
    for (final entry in _entries) {
      entry.remove();
    }
    _entries.clear();
    // _updatePositions();
  }

  List<OverlayEntry> get allEntries => List.unmodifiable(_entries);

  void _updatePositions() {
    for (var i = 0; i < _entries.length; i++) {
      _entries[i].markNeedsBuild();
    }
  }
}
