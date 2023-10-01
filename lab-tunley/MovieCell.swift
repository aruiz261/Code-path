//
//
//  Created by Ana Ruiz
//
import Nuke
import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func configure(with movie: Movie) {
        movieTitle.text = movie.original_title
        movieDescriptionLabel.text = movie.overview
        
        if let combinedURL = movie.baseURL?.appendingPathComponent(movie.poster_path){
            Nuke.loadImage(with: combinedURL, into: movieImageView)
        }else{
            print("Invalid base URL or path")
        }

      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
