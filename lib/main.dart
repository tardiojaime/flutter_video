import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/provideers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostReposity =
        VideoPostsRepositoryImple(videosDatasource: LocalVideoDatasourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // lazy: false indica que el proveedor debe ser creado inmediatamente
            // por defecto true, solo se crea cuando un widget lo requiere
            lazy: false,
            create: (_) => DiscoverProvider(videoRepository: videoPostReposity)
              ..loadNextPage())
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
