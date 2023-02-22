part of 'download_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.idle() = Idle;
  const factory DownloadState.inProgress({required double progress}) = Progress;
  const factory DownloadState.complete() = Complete;
  const factory DownloadState.error(Error e) = Error;
}
