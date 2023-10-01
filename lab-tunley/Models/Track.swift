//
//
//
//  Created by Ana Ruiz
//

import Foundation

struct Movie: Decodable{
    let original_title:String
    let overview: String
    let poster_path: String
    let backdrop_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let baseURL=URL(string: "https://image.tmdb.org/t/p/original/")
}

struct MoviesResponse: Decodable{
    let results: [Movie]
}

/*extension Movie{
    static var mockMovies: [Movie]=[
        Movie(movieTitle: "Talk to me", movieDescription: "When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.", moviePoster: URL(string:"/kdPMUMJzyYAc4roD52qavX0nLIC.jpg")!, backDropImage:URL(string:"/iIvQnZyzgx9TkbrOgcXx0p7aLiq.jpg")!, voteAverage: 7.2, voteCount: 758, popularity: 2025.794),
        Movie(movieTitle: "Blue Beetle", movieDescription: "Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it. As he searches to find his purpose in the world, fate intervenes when Jaime unexpectedly finds himself in possession of an ancient relic of alien biotechnology: the Scarab.", moviePoster: URL(string:"/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg")!, backDropImage: URL(string: "/H6j5smdpRqP9a8UnhWp6zfl0SC.jpg")!, voteAverage: 7.1, voteCount: 703, popularity: 2763.49),
        Movie(movieTitle: "Barbie", movieDescription: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.", moviePoster: URL(string: "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")!, backDropImage: URL(string: "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg")!, voteAverage: 7.3, voteCount: 4867, popularity: 1906.284),
        Movie(movieTitle: "Meg 2: The Trench", movieDescription: "An exploratory dive into the deepest depths of the ocean of a daring research team spirals into chaos when a malevolent mining operation threatens their mission and forces them into a high-stakes battle for survival.", moviePoster: URL(string: "/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg")!, backDropImage: URL(string: "/8pjWz2lt29KyVGoq1mXYu6Br7dE.jpg")!, voteAverage: 7, voteCount: 1866, popularity: 2027.1),
        Movie(movieTitle: "Retribution", movieDescription: "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks. With his kids trapped in the back seat and a bomb that will explode if they get out of the car, a normal commute becomes a twisted game of life or death as Matt follows the stranger's increasingly dangerous instructions in a race against time to save his family.", moviePoster: URL(string: "/oUmmY7QWWn7OhKlcPOnirHJpP1F.jpg")!, backDropImage: URL(string: "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg")!, voteAverage: 6.8, voteCount: 168, popularity: 1928.276)
    ]
}*/


// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
