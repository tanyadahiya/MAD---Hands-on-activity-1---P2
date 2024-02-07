// 2. You are developing a music streaming application. Define an abstract class MediaItem
// representing various media items such as songs, albums, and playlists. Implement concrete classes
// Song, Album, and Playlist that extend the MediaItem class. Additionally, create an interface Playable
// with a method play() that must be implemented by all media items.
// Create a Logger mixin that provides logging functionality to classes in your application. The Logger
// mixin should include methods for logging debug, info, warning, and error messages. Implement this
// mixin in various classes throughout your application to enable logging functionality wherever
// needed.


abstract class MediaItem {
  String title;
  String artist;
  MediaItem(this.title, this.artist);
}

abstract class Playable {
  void play();
}

mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

class Song extends MediaItem with Logger implements Playable {
  Song(String title, String artist) : super(title, artist);

  @override
  void play() {
    if (title.isNotEmpty && artist.isNotEmpty){
      logInfo('Playing: $title by $artist');
      logDebug('Preparing to play: $title');
      logInfo('Now Playing: $title by $artist');
    }
    else {
      logWarning('Invalid song details.'); 
      logError('Can not play the song.');
      }
}
}

class Album extends MediaItem with Logger implements Playable {
  List<Song> songs;
  Album(String title, String artist, this.songs) : super(title, artist);
  
  @override
  void play() {
    if (songs.isNotEmpty) {
      logInfo('Album details: $title by $artist');
      logDebug('Preparing to play album: $title');
    } else {
      logWarning('Invalid album details.'); 
      logError('Can not play.');
    }
  }
}

class Playlist extends MediaItem with Logger implements Playable  {
  List<MediaItem> items;
  Playlist(String title, String artist, this.items) : super(title, artist);

  @override
  void play() {
    if (items.isNotEmpty) {
      logInfo('Playlist details: $title by $artist');
      logDebug('Preparing to play playlist: $title');
    } else {
      logWarning('No items in the playlist.'); 
      logError('Can not play.');
    }
  }
}

void main() {
  Song song = Song('Tera hone laga hu', 'Atif Aslam');
  song.play();
  print('-----------------------------------------------------------');

  Album album = Album('Rustom', 'Atif Aslam', [Song('Tera hone lga hu', 'Atif Aslam'), Song('Teri Ore', 'Rahat Fateh Ali ')]);
  album.play();
  print('-----------------------------------------------------------');

  Playlist playlist = Playlist('My Playlist', 'Tanya', [song, album]);
  playlist.play();
  print('-----------------------------------------------------------');
}