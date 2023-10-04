import 'package:bls/pages/practice_set/practice_set_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PracticeSetPage extends StatefulWidget {
  const PracticeSetPage({super.key});

  @override
  State<PracticeSetPage> createState() => _PracticeSetPageState();
}

class _PracticeSetPageState extends State<PracticeSetPage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    Get.put(PracticeSetController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PracticeSetController>(builder: (state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Questions"),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: PageView.builder(
                itemCount: state.questionsSet.length,
                itemBuilder: (c, index) {
                  Question question = state.questionsSet.elementAt(index);
                  if (question.type == QuestionType.shortQuestion) {
                    ShortQuestion shortQuestion = question.asShortQuestion();
                    return Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Q.${index + 1}. ${shortQuestion.questionText}",
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(child: Container()),
                        TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                              hintText: "Type your answer . .",
                              suffix: IconButton(
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
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }
                  MCQ mcq = question.asMcq();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Q.${index + 1}. ${mcq.questionText}",
                        textScaleFactor: 1.5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(child: Container()),
                      Expanded(
                        child: ListView.builder(
                            itemCount: mcq.choices.length,
                            itemBuilder: (c, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton.extended(
                                  heroTag: "options$index",
                                  onPressed: () {},
                                  label: Text(
                                    "${String.fromCharCode(65 + index)}. ${mcq.choices[index]}",
                                    textScaleFactor: 1.5,
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  );
                })),
        bottomNavigationBar: Padding(
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
