import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  final String url;
  final String title;
  const PDFViewerPage({super.key, required this.url, required this.title});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PdfViewerController pdfViewerController = PdfViewerController();
  PdfTextSearchResult _searchResult = PdfTextSearchResult();
  TextEditingController controller = TextEditingController();
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isSearchVisible ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
                controller.clear();
                _searchResult.clear();
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SfPdfViewer.asset(
            widget.url,
            controller: pdfViewerController,
            onDocumentLoaded: (d) {
              setState(() {});
            },
            // password: 'syncfusion',
            pageLayoutMode: PdfPageLayoutMode.single,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedOpacity(
                opacity: isSearchVisible ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SearchBar(
                    hintText: "Search",
                    controller: controller,
                    trailing: [
                      IconButton(
                          onPressed: () {
                            _searchResult = pdfViewerController.searchText(
                                controller.value.text.toLowerCase());

                            _searchResult.addListener(() {
                              if (_searchResult.hasResult) {
                                setState(() {});
                              }
                            });
                          },
                          icon: const Icon(Icons.search)),
                      Visibility(
                        visible: _searchResult.hasResult,
                        child: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            setState(() {
                              controller.clear();
                              _searchResult.clear();
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: _searchResult.hasResult,
                        child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                          ),
                          onPressed: () {
                            _searchResult.previousInstance();
                          },
                        ),
                      ),
                      Visibility(
                        visible: _searchResult.hasResult,
                        child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_right,
                          ),
                          onPressed: () {
                            _searchResult.nextInstance();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
              onPressed: () {
                pdfViewerController.previousPage();
                setState(() {});
              },
            ),
            Text(
              "${pdfViewerController.pageNumber} / ${pdfViewerController.pageCount}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              onPressed: () {
                pdfViewerController.nextPage();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
