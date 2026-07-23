import 'dart:async';
import 'package:flutter/material.dart';

/// Timer de quiz avec affichage visuel et alerte de fin.
/// Peut être configuré pour différents intervalles de temps.
class QuizTimer extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onTimeUp;
  final bool showProgress;
  final Color? activeColor;
  final Color? warningColor;
  final Color? expiredColor;

  const QuizTimer({
    super.key,
    required this.duration,
    this.onTimeUp,
    this.showProgress = true,
    this.activeColor,
    this.warningColor,
    this.expiredColor,
  });

  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  Timer? _timer;
  Duration _remaining = Duration.zero;
  bool _isExpired = false;

  @override
  void initState() {
    super.initState();
    _remaining = widget.duration;
    _startTimer();
  }

  @override
  void didUpdateWidget(QuizTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _timer?.cancel();
      _remaining = widget.duration;
      _isExpired = false;
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remaining.inSeconds > 0) {
          _remaining = _remaining - const Duration(seconds: 1);
        } else {
          _isExpired = true;
          _timer?.cancel();
          widget.onTimeUp?.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Color _getTimerColor() {
    if (_isExpired) {
      return widget.expiredColor ?? const Color(0xFFE41E3F);
    }
    final warningThreshold = widget.duration * 0.3;
    if (_remaining <= warningThreshold) {
      return widget.warningColor ?? const Color(0xFFFF9500);
    }
    return widget.activeColor ?? const Color(0xFF1877F2);
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.duration.inSeconds > 0
        ? _remaining.inSeconds / widget.duration.inSeconds
        : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getTimerColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _getTimerColor(), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _isExpired ? Icons.timer_off : Icons.timer,
            color: _getTimerColor(),
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            _formatDuration(_remaining),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _getTimerColor(),
            ),
          ),
        ],
      ),
    );
  }
}
