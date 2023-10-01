//
//
//
//  Created by Ana Ruiz
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

        
    @IBOutlet weak var MovieImageView: UIImageView!
    
    @IBOutlet weak var MovieAverageLabel: UILabel!
    
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieCountLabel: UILabel!
    
    
    
    @IBOutlet weak var MoviePopularityLabel: UILabel!
    
    @IBOutlet weak var MovieDescriptionLabel: UILabel!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let combinedURL = movie.baseURL?.appendingPathComponent(movie.backdrop_path){
            Nuke.loadImage(with: combinedURL, into:MovieImageView)
        }else{
            print("Invalid base URL or path")
        }
    
       
        MovieTitle.text = movie.original_title
        MovieAverageLabel.text = String(movie.vote_average)
        MovieCountLabel.text = String(movie.vote_count)
        MoviePopularityLabel.text = String(movie.popularity)
        MovieDescriptionLabel.text=movie.overview
        

      

    }

}
