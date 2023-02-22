// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_download_demo/download/download.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('DownloadCubit', () {
//     test('initial state is 0', () {
//       expect(DownloadCubit().state, equals(0));
//     });

//     blocTest<DownloadCubit, int>(
//       'emits [1] when increment is called',
//       build: DownloadCubit.new,
//       act: (cubit) => cubit.increment(),
//       expect: () => [equals(1)],
//     );

//     blocTest<DownloadCubit, int>(
//       'emits [-1] when decrement is called',
//       build: DownloadCubit.new,
//       act: (cubit) => cubit.decrement(),
//       expect: () => [equals(-1)],
//     );
//   });
// }
