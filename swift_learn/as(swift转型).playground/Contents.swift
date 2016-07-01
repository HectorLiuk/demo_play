//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)

    }
    //泛型定义方法
    func swapTwoValues<T>(inout a : T,inout _ b : T ){
        let temporaryA = a
        a = b
        b = temporaryA
        print(a,b)
    }
}

let swapSong = Song.init(name: "ss", artist: "ww")
var ss = "ss"
var ww = "ww"
swapSong.swapTwoValues(&ss, &ww)



let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
    "ssss"
]


var movieCount = 0
var songCount = 0
// is 用来检出这个类是否是子类
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}


// as 对转型
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }else{
        print(item)
    }
}



