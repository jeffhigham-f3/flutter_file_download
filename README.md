# Flutter Download Demo

Demonstrates a file download with linear progress indication using dart:io and BLOC

### download_page.dart

```dart
BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, state) => state.when(
            idle: () => const _IdleWidget(),
            inProgress: (progress) => _ProgressWidget(progress: progress),
            complete: () => const _CompleteWidget(),
            error: (e) => _ErrorWidget(e.toString()),
          ),
```

### download_bloc.dart

```dart
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
```

### info.plist

```xml
<key>LSSupportsOpeningDocumentsInPlace</key>
<true/>
<key>UIFileSharingEnabled</key>
<true/>

```
