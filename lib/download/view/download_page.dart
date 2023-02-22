// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_download_demo/download/download.dart';
import 'package:flutter_download_demo/l10n/l10n.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadBloc(),
      child: const DownloadView(),
    );
  }
}

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.downloadAppBarTitle)),
      body: Center(
        child: BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, state) => state.when(
            idle: () => const _IdleWidget(),
            inProgress: (progress) => _ProgressWidget(progress: progress),
            complete: () => const _CompleteWidget(),
            error: (e) => _ErrorWidget(e.toString()),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async => context.read<DownloadBloc>().add(
                  const Download(),
                ),
            child: const Icon(
              Icons.download,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressWidget extends StatelessWidget {
  const _ProgressWidget({
    required this.progress,
  });

  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Downloading ...',
          style: TextStyle(
            fontSize: 25,
            color: Colors.amber.shade800,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(10),
          child: LinearProgressIndicator(
            value: progress ?? 0,
            backgroundColor: Colors.amber.shade100,
            color: Colors.amber.shade600,
            minHeight: 20,
          ),
        ),
      ],
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget(this.error);

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error ?? 'Something unexpected happened.',
        style: TextStyle(
          fontSize: 25,
          color: Colors.amber.shade800,
        ),
      ),
    );
  }
}

class _CompleteWidget extends StatelessWidget {
  const _CompleteWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Complete!',
        style: TextStyle(
          fontSize: 25,
          color: Colors.amber.shade800,
        ),
      ),
    );
  }
}

class _IdleWidget extends StatelessWidget {
  const _IdleWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Let's Download Something!",
        style: TextStyle(
          fontSize: 25,
          color: Colors.amber.shade800,
        ),
      ),
    );
  }
}
