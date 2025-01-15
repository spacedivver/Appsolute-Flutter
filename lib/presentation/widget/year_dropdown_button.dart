import 'package:flutter/material.dart';

class YearDropdownButton extends StatefulWidget {
  final Function(String) onYearChanged;
  final String selectedYear;

  const YearDropdownButton({
    super.key,
    required this.onYearChanged,
    required this.selectedYear,
  });

  @override
  State<YearDropdownButton> createState() => _YearDropdownButtonState();
}

class _YearDropdownButtonState extends State<YearDropdownButton> {
  bool _isDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 8,
        width: size.width,
        child: Material(
          elevation: 4,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var year in ['2025년', '2024년', '2023년', '2022년', '2021년'])
                  InkWell(
                    onTap: () {
                      widget.onYearChanged(year);
                      setState(() {
                        _isDropdownOpen = false;
                      });
                      _removeOverlay();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 37,
                      padding: const EdgeInsets.only(left: 14),
                      decoration: BoxDecoration(
                        color: year == widget.selectedYear
                            ? const Color(0xFFE9ECEF)
                            : Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          year,
                          style: const TextStyle(
                            color: Color(0xFF343A40),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isDropdownOpen = !_isDropdownOpen;
            if (_isDropdownOpen) {
              _showDropdown();
            } else {
              _removeOverlay();
            }
          });
        },
        child: Container(
          width: 100,
          height: 38,
          padding:
              const EdgeInsets.only(top: 8, left: 13, right: 10, bottom: 8),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.selectedYear,
                style: const TextStyle(
                  color: Color(0xFF343A40),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Icon(
                _isDropdownOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: const Color(0xFF343A40),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
