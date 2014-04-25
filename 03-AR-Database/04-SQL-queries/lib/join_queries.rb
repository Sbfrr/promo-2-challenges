require 'sqlite3'

# opens the database
DATABASE_PATH = "db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute("SELECT track.Name, album.Title, artist.name  FROM track
    INNER JOIN album, artist
    ON track.AlbumId == album.AlbumId AND album.ArtistId == artist.ArtistId")
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
end