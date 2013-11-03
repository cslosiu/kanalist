//
//  ContentViewController.h
//  kanalist
//
//  Created by siu on 13年6月24日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "JPLetter.h"

@interface ContentViewController : UIViewController {
    //IBOutlet UIImageView *_image;
    
}

@property IBOutlet UIImageView *image;
@property IBOutlet UIButton *kanaButton;     // show the letter and play
@property IBOutlet UIButton *playWordButton; // play word pronounciation
@property IBOutlet UILabel *wordLabel;

@property (nonatomic, retain) JPLetter *letter;
@property (nonatomic) SystemSoundID wordSoundID;
@property (nonatomic) SystemSoundID kanaSoundID;


-(IBAction)playWord:(id)sender;
-(IBAction)playLetter:(id)sender;

@end
