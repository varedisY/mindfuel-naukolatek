import 'package:asq_app/home.dart';
import 'package:asq_app/models/question.dart';
import 'package:asq_app/screens/question.dart';
import 'package:asq_app/screens/session_outcome.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:flutter/cupertino.dart';

class Session extends StatefulWidget {
  final List<Question> questions;

  const Session({super.key, required this.questions});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  late final PageController _pageController;
  late final List<String> _answers;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _answers = List.filled(widget.questions.length, "");
    _pageController.addListener(_updateCurrentPageIndex);
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPageIndex);
    _pageController.dispose();
    super.dispose();
  }

  void _updateCurrentPageIndex() {
    setState(() {
      _currentPageIndex = _pageController.page?.round() ?? 0;
    });
  }

  void _handlePreviousPressed() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNextPressed() {
    if (_currentPageIndex == widget.questions.length - 1) {
      _navigateToResults();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToResults() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder:
            (context) => SessionOutcome(
              outcome: SessionOutcomeData(widget.questions, _answers),
            ),
      ),
    );
  }

  void _updateAnswer(int index, String value) {
    _answers[index] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNavigationControls(),
        SizedBox(height: p4),
        _buildQuestionsPageView(),
      ],
    );
  }

  Widget _buildNavigationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text("Back", style: TextStyle(color: sessionTextColor)),
          onPressed: _currentPageIndex > 0 ? _handlePreviousPressed : null,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            _currentPageIndex == widget.questions.length - 1
                ? "Finish"
                : "Next",
            style: TextStyle(color: sessionTextColor),
          ),
          onPressed: _handleNextPressed,
        ),
      ],
    );
  }

  Widget _buildQuestionsPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          return QuestionForm(
            onAnswerChanged: (value) => _updateAnswer(index, value),
            question: widget.questions[index],
            isLast: index == widget.questions.length - 1,
          );
        },
      ),
    );
  }
}
