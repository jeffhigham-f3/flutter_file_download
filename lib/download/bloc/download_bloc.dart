import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';

part 'download_event.dart';
part 'download_state.dart';
part 'download_bloc.freezed.dart';

const kFile = 'file_10mb.txt';
const kUrl = 'http://download.jeffhigham.com/$kFile';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(const DownloadState.idle()) {
    on<Download>(
      (event, emit) async {
        final client = HttpClient();
        final downloadData = <int>[];
        final directory = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory();
        final filePath = File('${directory?.path}/$kFile');
        final url = Uri.parse(kUrl);
        final request = await client.getUrl(url)
          ..headers.removeAll(HttpHeaders.acceptEncodingHeader);
        final response = await request.close();
        final totalSize = response.contentLength;
        var downloaded = 0;
        await emit.forEach(
          response,
          onData: (data) {
            downloadData.addAll(data);
            downloaded += data.length;
            return DownloadState.inProgress(progress: downloaded / totalSize);
          },
        );
        await filePath.writeAsBytes(downloadData);
        client.close();
        emit(const DownloadState.complete());
        await Future<void>.delayed(
          const Duration(
            seconds: 2,
          ),
        ).then(
          (_) => emit(
            const DownloadState.idle(),
          ),
        );
      },
      transformer: restartable(),
    );
  }
}
