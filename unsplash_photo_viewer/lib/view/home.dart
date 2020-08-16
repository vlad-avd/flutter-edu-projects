import 'package:flutter/material.dart';
import '../api_service/api_service.dart';
import '../model/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _keyword;
  List<Photo> _data = List<Photo>();

  _onChangeText(text) {
    _keyword = text;
    if (_keyword != '') {
      ApiService.fetchSearchResult(_keyword).then((data) => setState(() {
            _data = data.photos;
          }));
    } else {
      ApiService.fetchPhotos().then((data) => setState(() {
            _data = data;
          }));
    }
  }

  @override
  void initState() {
    super.initState();
    ApiService.fetchPhotos().then((data) => setState(() {
          _data = data;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Image.asset('assets/images/unsplash.png', width: 300, height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextField(
              onChanged: _onChangeText,
              decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Visibility(
            visible: _data.length > 0,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return PhotoRecord(_data[index]);
                    }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class PhotoRecord extends StatelessWidget {
  final Photo _photo;

  PhotoRecord(this._photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoCardScreen(_photo.urls.small))),
            child: SizedBox(
                width: 100,
                child: Image.network(_photo.urls.small, fit: BoxFit.cover))),
        title: Text(
          _photo.name.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Photo by: ' + _photo.author.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class PhotoCardScreen extends StatelessWidget {
  final String _url;

  PhotoCardScreen(this._url);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.network(
        _url,
        fit: BoxFit.contain,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
