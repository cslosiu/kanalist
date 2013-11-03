//
//  AlphabetListViewController.h
//  kanalist
//
//  Created by siu on 13年6月2日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface AlphabetListViewController : UITableViewController 
{
    NSMutableArray *_letters;
    UIFont *cellFont;
    UIFont *detailFont;
    
    GADBannerView *bannerView_;
}

@end
