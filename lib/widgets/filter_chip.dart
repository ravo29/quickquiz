import 'package:flutter/material.dart';

/// Chip de filtrage personnalisé pour les catégories et filtres.
/// Supporte la sélection multiple et les états visuels distincts.
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? selectedColor;
  final Color? backgroundColor;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.icon,
    this.selectedColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSelectedColor = selectedColor ?? const Color(0xFF1877F2);
    final effectiveBackgroundColor = backgroundColor ?? 
        Theme.of(context).chipTheme.backgroundColor;

    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16),
            const SizedBox(width: 6),
          ],
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: onTap != null ? (_) => onTap!() : null,
      selectedColor: effectiveSelectedColor.withOpacity(0.2),
      checkmarkColor: effectiveSelectedColor,
      backgroundColor: effectiveBackgroundColor,
      labelStyle: TextStyle(
        color: isSelected ? effectiveSelectedColor : null,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? effectiveSelectedColor : Colors.grey,
        width: isSelected ? 1.5 : 1,
      ),
    );
  }
}

/// Groupe de chips de filtrage avec sélection unique.
class SingleChoiceFilterGroup extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onSelectionChanged;
  final List<IconData>? icons;
  final Color? selectedColor;

  const SingleChoiceFilterGroup({
    super.key,
    required this.options,
    this.selectedOption,
    required this.onSelectionChanged,
    this.icons,
    this.selectedColor,
  });

  @override
  State<SingleChoiceFilterGroup> createState() => _SingleChoiceFilterGroupState();
}

class _SingleChoiceFilterGroupState extends State<SingleChoiceFilterGroup> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  void didUpdateWidget(SingleChoiceFilterGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedOption != oldWidget.selectedOption) {
      _selectedOption = widget.selectedOption;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final icon = widget.icons != null && index < widget.icons!.length
            ? widget.icons![index]
            : null;

        return FilterChipWidget(
          label: option,
          isSelected: _selectedOption == option,
          icon: icon,
          selectedColor: widget.selectedColor,
          onTap: () {
            setState(() {
              if (_selectedOption == option) {
                _selectedOption = null;
              } else {
                _selectedOption = option;
              }
            });
            widget.onSelectionChanged(_selectedOption);
          },
        );
      }).toList(),
    );
  }
}
