require 'sqlite3'
require 'pp'

# opens the database
database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute("SELECT track.Name, album.Title, artist.name
    FROM track
    INNER JOIN album, artist
    ON track.AlbumId == album.AlbumId
    AND album.ArtistId == artist.ArtistId")
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  stat = db.execute("SELECT AVG(Milliseconds), COUNT(track.Name), genre.Name
    FROM track
    INNER JOIN genre
    ON genre.GenreId == track.GenreId
    WHERE genre.Name == '#{category}'
    GROUP BY  genre.GenreId").flatten

  stats = { category: stat[2],
    number_of_songs: stat[1],
    avg_length: (stat[0]/60000).round(2)}
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  db.execute("SELECT artist.name, COUNT(track.Name) AS track_count
    FROM track
    INNER JOIN album, artist, genre
    ON track.AlbumId == album.AlbumId
    AND album.ArtistId == artist.ArtistId
    AND genre.GenreId == track.GenreId
    WHERE genre.Name == 'Rock'
    GROUP BY artist.name
    ORDER BY track_count DESC
    LIMIT 5")
end


pp top_five_rock_artists(db)