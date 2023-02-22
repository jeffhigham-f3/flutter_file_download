// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_download_demo/download/download.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../helpers/helpers.dart';

// class MockDownloadCubit extends MockCubit<int> implements DownloadCubit {}

// void main() {
//   group('DownloadPage', () {
//     testWidgets('renders DownloadView', (tester) async {
//       await tester.pumpApp(const DownloadPage());
//       expect(find.byType(DownloadView), findsOneWidget);
//     });
//   });

//   group('DownloadView', () {
//     late DownloadCubit downloadCubit;

//     setUp(() {
//       downloadCubit = MockDownloadCubit();
//     });

//     testWidgets('renders current count', (tester) async {
//       const state = 42;
//       when(() => downloadCubit.state).thenReturn(state);
//       await tester.pumpApp(
//         BlocProvider.value(
//           value: downloadCubit,
//           child: const DownloadView(),
//         ),
//       );
//       expect(find.text('$state'), findsOneWidget);
//     });

//     testWidgets('calls increment when increment button is tapped',
//         (tester) async {
//       when(() => downloadCubit.state).thenReturn(0);
//       when(() => downloadCubit.increment()).thenReturn(null);
//       await tester.pumpApp(
//         BlocProvider.value(
//           value: downloadCubit,
//           child: const DownloadView(),
//         ),
//       );
//       await tester.tap(find.byIcon(Icons.add));
//       verify(() => downloadCubit.increment()).called(1);
//     });

//     testWidgets('calls decrement when decrement button is tapped',
//         (tester) async {
//       when(() => downloadCubit.state).thenReturn(0);
//       when(() => downloadCubit.decrement()).thenReturn(null);
//       await tester.pumpApp(
//         BlocProvider.value(
//           value: downloadCubit,
//           child: const DownloadView(),
//         ),
//       );
//       await tester.tap(find.byIcon(Icons.remove));
//       verify(() => downloadCubit.decrement()).called(1);
//     });
//   });
// }
