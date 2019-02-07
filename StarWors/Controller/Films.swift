//
//  Films.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/6/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class Films: UIViewController {

    var person: Person!
    let api = FilmApi()
    var films = [String]()
    var currentFilms = 0
    
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var crawlLbl: UITextView!
    
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        films = person.filmUrls
        guard let firstFilm = films.first else {return}
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        getFilm(url: firstFilm)
        
    }
    

    @IBAction func previousBtnClicked(_ sender: UIButton) {
        currentFilms -= 1
        setUpButtons()
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        currentFilms += 1
        setUpButtons()
    }
    
    
    
    func getFilm (url: String) {
        api.getFilms(url: url) { (f) in
            if let film = f {
                self.setUpView(film: film)
            }
        }
    }
    
    func setUpView (film: F) {
        titleLbl.text = film.title
        episodeLbl.text = "\(film.episode)"
        directorLbl.text = film.director
        producerLbl.text = film.producer
        yearLbl.text = film.year
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    
    func setUpButtons () {
        nextBtn.isEnabled = currentFilms == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilms == 0 ? false : true
        
        getFilm(url: films[currentFilms])
    }
    
}
