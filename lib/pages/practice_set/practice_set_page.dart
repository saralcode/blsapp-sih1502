import 'package:bls/customs/input_decoration/input_decoration.dart';
import 'package:bls/pages/practice_set/practice_set_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PracticeSetPage extends StatefulWidget {
  final List<Question>? shortsQuestion;

  const PracticeSetPage({super.key, this.shortsQuestion});

  @override
  State<PracticeSetPage> createState() => _PracticeSetPageState();
}

class _PracticeSetPageState extends State<PracticeSetPage> {
  TextEditingController controller = TextEditingController();
  int answerIndex = -1;
  bool? isCorrect;
  bool isshort = false;
  @override
  void initState() {
    Get.put(PracticeSetController());
    isshort = widget.shortsQuestion != null;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PracticeSetController>(builder: (state) {
      return Scaffold(
        appBar: !isshort
            ? AppBar(
                title: const Text("Practice Set"),
              )
            : null,
        body: Container(
            padding: const EdgeInsets.all(10),
            child: PageView.builder(
                itemCount: isshort
                    ? widget.shortsQuestion!.length
                    : state.questionsSet.length,
                itemBuilder: (c, index) {
                  Question question = isshort
                      ? widget.shortsQuestion!.elementAt(index)
                      : state.questionsSet.elementAt(index);
                  if (question.type == QuestionType.shortQuestion) {
                    ShortQuestion shortQuestion = question.asShortQuestion();
                    return Scaffold(
                      body: Column(
                        children: [
                          if (!isshort)
                            const SizedBox(
                              height: 60,
                            ),
                          Text(
                            "Q.${index + 1}. ${shortQuestion.questionText}",
                            textScaleFactor: 1.5,
                          ),
                          if (isshort) ...[
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(child: Container()),
                          ],
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      bottomSheet: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: "Type your answer . .",
                            border: border(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (shortQuestion.answer.toLowerCase() ==
                                      controller.value.text.toLowerCase()) {
                                    Get.showSnackbar(const GetSnackBar(
                                      duration: Duration(seconds: 2),
                                      title: "Correct",
                                      message: "Your answer is correct..",
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    Get.showSnackbar(const GetSnackBar(
                                      duration: Duration(seconds: 2),
                                      title: "Wrong",
                                      message:
                                          "Oops! Your answer is incorrect..",
                                      backgroundColor: Colors.pink,
                                    ));
                                  }
                                },
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ))),
                      ),
                    );
                  }
                  MCQ mcq = question.asMcq();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isshort) ...[
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                      Text(
                        "Q.${index + 1}. ${mcq.questionText}",
                        textScaleFactor: 1.5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!isshort) Expanded(child: Container()),
                      Expanded(
                        child: ListView.builder(
                            itemCount: mcq.choices.length,
                            itemBuilder: (c, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor: isCorrect == null
                                      ? Colors.indigo
                                      : answerIndex == index &&
                                              isCorrect == false
                                          ? Colors.red
                                          : mcq.answer == index
                                              ? Colors.green.shade700
                                              : Colors.indigo,
                                  heroTag: "options$index",
                                  onPressed: () {
                                    setState(() {
                                      answerIndex = index;
                                      isCorrect = mcq.answer == index;
                                    });
                                  },
                                  label: Text(
                                    "${String.fromCharCode(65 + index)}. ${mcq.choices[index]}",
                                    textScaleFactor: 1.5,
                                  ),
                                ),
                              );
                            }),
                      ),
                      // const SizedBox(
                      //   height: 50,
                      // )
                      Center(
                        child: AnimatedOpacity(
                          opacity: isCorrect != null ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              isCorrect == true
                                  ? Icons.published_with_changes
                                  : Icons.unpublished_outlined,
                              color:
                                  isCorrect == true ? Colors.green : Colors.red,
                              size: 35,
                            ),
                            label: Text(
                              "Your answer is ${isCorrect == true ? "Correct" : "Wrong"}",
                              style: TextStyle(
                                  color: isCorrect == true
                                      ? Colors.green.shade700
                                      : Colors.pink,
                                  fontSize: 20,
                                  fontFamily: "serif"),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                })),
        bottomNavigationBar: isshort
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.extended(
                        backgroundColor: Colors.pink,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                        label: const Text("Previous")),
                    FloatingActionButton.extended(
                        backgroundColor: Colors.pink,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {},
                        label: const Text("Next"))
                  ],
                ),
              ),
      );
    });
  }
}
