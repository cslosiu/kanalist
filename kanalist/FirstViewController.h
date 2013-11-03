//
//  FirstViewController.h
//  kanalist
//
//  Created by siu on 13年5月27日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    
}

@property IBOutlet UIButton *callButton;
@property IBOutlet UIButton *openWebsiteButton;

- (IBAction)openSite:(id)sender;
- (IBAction)callPhone:(id)sender;

@end
