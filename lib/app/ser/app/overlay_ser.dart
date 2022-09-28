import 'package:flutter/material.dart';

class OverlaySer {
  late List<OverlayEntry>? _entries = [];
  late OverlayState? _state;
  late List<String> _layer = [];

  static final _ser = OverlaySer._internal();
  factory OverlaySer() => _ser;
  OverlaySer._internal();

  Future<void> createOverlay(
    BuildContext context,
    bool isRoot,
    List<OverlayEntry> entries,
    List<String> ids,
  ) async {
    _state = Overlay.of(context, rootOverlay: isRoot);
    _entries = entries;
    for (int i = 0; i < _entries!.length; i++) {
      _state!.insert(entries[i]);
      _layer.add(ids[i]);
    }
  }

  void addLoadingOverlay(OverlayEntry entry) {
    _entries!.add(entry);
    _state!.insert(entry);
    _layer.add('LoadingOverlay');
  }

  Future<void> removeOverlay(String id) async {
    if (_layer.contains(id)) {
      int removeIndex = _layer.indexOf(id);
      _entries![removeIndex].remove();
      _entries!.removeAt(removeIndex);
      _layer.removeAt(removeIndex);
    }
  }

  Future<void> removeLoadingOverlay() async {
    if (_layer.contains('LoadingOverlay')) {
      int loadingIndex = _layer.indexOf('LoadingOverlay');
      _entries![loadingIndex].remove();
      _entries!.removeAt(loadingIndex);
      _layer.removeAt(loadingIndex);
    }
  }

  bool isExistedOverlay() => _entries!.isNotEmpty;

  void removeAllOverlay() {
    for (String layer in _layer) {
      int loadingIndex = _layer.indexOf(layer);
      _entries![loadingIndex].remove();
      _entries!.removeAt(loadingIndex);
      _layer.removeAt(loadingIndex);
    }
  }
}
