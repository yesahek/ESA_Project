// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;

// import '../widget/my_appBar.dart';

// class bookReaderScreen extends StatefulWidget {
//   final String courseTitle;
//   final String firstName;
//   final String materialTitle;
//   const bookReaderScreen({
//     Key? key,
//     required this.courseTitle,
//     required this.firstName,
//     required this.materialTitle,
//   }) : super(key: key);

//   @override
//   State<bookReaderScreen> createState() => _bookReaderScreenState();
// }

// class _bookReaderScreenState extends State<bookReaderScreen> {
//  late PDFViewController _pdfViewController;
//   int _currentPage = 1;

//   @override
//   void initState() {
//     super.initState();
//     _pdfViewController = PDFViewController.fromFile("url");
//   }

//   Future<void> _loadPdfInfo() async {
//     final totalPageCount = await _pdfViewController.getPageCount();
//     setState(() {
//       _totalPages = totalPageCount;
//     });
//   }

//   void _onPageChanged(int page, int total) {
//     setState(() {
//       _currentPage = page;
//       _totalPages = total;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 MyAppBar(
//                   backArrow: true,
//                   title: widget.courseTitle,
//                   name: widget.firstName,
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                       child: PDFView(
//                         filePath: widget.pdfUrl,
//                         controller: _pdfViewController,
//                         onRender: (_pages) => _loadPdfInfo(),
//                         onPageChanged: (page, total) =>
//                             _onPageChanged(page, total),
//                       ),
//                     ),
//                     Text('Page ${_currentPage + 1} of $_totalPages'),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             _pdfViewController.previousPage(
//                               duration: Duration(milliseconds: 200),
//                               curve: Curves.easeInOut,
//                             );
//                           },
//                           child: Icon(Icons.chevron_left),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _pdfViewController.nextPage(
//                               duration: Duration(milliseconds: 200),
//                               curve: Curves.easeInOut,
//                             );
//                           },
//                           child: Icon(Icons.chevron_right),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
