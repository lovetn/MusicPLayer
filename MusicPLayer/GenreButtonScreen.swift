
import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPLayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                DispatchQueue.main.async {
                 self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
    }
    
    
    @IBAction func stoButtonTapped(_ sender: UIButton) {
        musicPLayer.stop()    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPLayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPLayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPLayer.setQueue(with: query)
        musicPLayer.shuffleMode = .songs
        musicPLayer.play()
        
    }
}
    


