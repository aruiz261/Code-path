//
//  PostersViewController.swift
//  lab-tunley
//
//  Created by Delch Enterprises on 10/1/23.
//
import Nuke
import UIKit

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return posters.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCellCollectionViewCell
            
            let poster = posters[indexPath.item]
            
            if let combinedURL = poster.baseURL?.appendingPathComponent(poster.poster_path) {
                Nuke.loadImage(with: combinedURL, into: cell.posterImageView)
            } else {
                print("Invalid base URL or path")
            }
            
            return cell
        }
    

    var posters: [Poster] = []

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self 
       
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=69b1a84a7597e65e6e9a6ec135cd6bc6")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            guard let data = data else {
                print("❌ Data is nil")
                return
            }

          
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PostersResponse.self, from: data)
                let posters = response.results
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }               
                print(posters)
            } catch {
                print(error.localizedDescription)
            }
        }

        task.resume()
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

    
        layout.minimumInteritemSpacing = 4

      
        layout.minimumLineSpacing = 4

        let numberOfColumns: CGFloat = 3

        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        layout.itemSize = CGSize(width: width, height: width)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
