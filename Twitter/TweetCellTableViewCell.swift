//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Kay Lab on 2/4/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    

    @IBOutlet weak var retweetButton: UIButton!
   
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
    
        let tobeFavorited = !favorited
        if(tobeFavorited){
            
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not secceed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("unfavorite did not succeed: \(error)")
            })
        }
    
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setreTweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    
    }
    
    func setreTweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
        
    }
   
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
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
