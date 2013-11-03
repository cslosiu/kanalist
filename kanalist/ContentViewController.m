//
//  ContentViewController.m
//  kanalist
//
//  Created by siu on 13年6月24日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CFURLRef) createSoundRef:(NSString*)soundfilename {
    
    //declare a system sound
    NSURL *url   = [[NSBundle mainBundle] URLForResource: soundfilename
                                                 withExtension: @"mp3"];
    
    //NSLog(@"SOUND: %@", soundfilename);
    //NSLog(@"URL: %@", url);
    
    // just like retain in ARC mode
    CFURLRef urlref = (CFURLRef) CFBridgingRetain(url);
    return urlref;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //UIColor *bgcolor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg1.jpg"]];
    //[self.view setBackgroundColor:bgcolor];

    
    NSString *caption = [NSString stringWithFormat:@"%@  %@", self.letter.hiragana,
                         self.letter.katakana];
    self.navigationItem.title = caption;
    
    [self.image setImage:[UIImage imageNamed:self.letter.imageFile]];
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID ([self createSoundRef:self.letter.wordSoundfile], & _wordSoundID);
    self.playWordButton.enabled = _wordSoundID != 0;
    
    AudioServicesCreateSystemSoundID ([self createSoundRef:self.letter.kanaSoundfile], & _kanaSoundID);
    self.kanaButton.enabled = _kanaSoundID != 0;
    
    [self.wordLabel setText:self.letter.word];
    [self.playWordButton setTitle:self.letter.word forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(void) playLetter:(id)sender {
    AudioServicesPlaySystemSound(_kanaSoundID);

}

-(void) playWord:(id)sender {
	AudioServicesPlaySystemSound(_wordSoundID);
    
}

@end
