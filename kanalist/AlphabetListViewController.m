//
//  AlphabetListViewController.m
//  kanalist
//
//  Created by siu on 13年6月2日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import <iAd/iAd.h>
#import "AlphabetListViewController.h"
#import "JPLetter.h"
#import "ContentViewController.h"
#define MY_BANNER_UNIT_ID @"4678b1711f634793"

@interface AlphabetListViewController ()

@end

@implementation AlphabetListViewController

#pragma mark - life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Kana", @"Kana");
        //self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        
        //UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg1.jpg"]];
        //UITableView *myview = (UITableView*)self.view;
        //[myview setBackgroundView:im];

        cellFont = [UIFont systemFontOfSize:26.0];        
        detailFont = [UIFont systemFontOfSize:24.0];
    }
    return self;
}

/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // Specify the ad unit ID.
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    //[self.view addSubview:bannerView_];
    self.tableView.tableHeaderView = bannerView_;
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];

    self.tableView.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*
     * alphabets.txt structure.
     *
     # DESIGN: key,平 片 字母發音(key+mp3) 詞圖片(key+png) 詞發音("word"+key+mp3)
     # DESIGN: a,あ,ア,a.mp3,a.png,word-a.mp3
     #
     a,あ,ア
     ...
     * ACTUAL: only store first 3 items.
     */
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"alphabets" ofType:@"txt"];
    if (filePath) {
        NSError *error;
        NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        _letters = (NSMutableArray*) [myText componentsSeparatedByString:@"\n"];
        //NSLog(@"read %d lines", [_letters count]);
        for (int i=0; i < [_letters count]; i++) {
            NSString *s = (NSString*) _letters[i];
            NSArray *parts = [s componentsSeparatedByString:@","];
            if ([parts count] == 6) {
                JPLetter *e = [JPLetter new];
                e.roman = parts[0];
                e.hiragana = parts[1];
                e.katakana = parts[2];
                e.wordsound = parts[3];
                e.image = parts[4];
                e.word = parts[5];
                [_letters replaceObjectAtIndex:i withObject:e];
            }
            else {
                // usually the last
                [_letters removeObjectAtIndex:i];
            }
        }
    }
    
    //NSLog(@"count %d", [_letters count]);
    //JPLetter *e = _letters[34];
    //NSLog(@"index 34: %@ ", e.hiragana);
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_letters count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    JPLetter *e = _letters[indexPath.row];
    NSString *label = [NSString stringWithFormat:@"%@  %@", e.hiragana, e.katakana];
    [cell.textLabel setText:label];
    cell.textLabel.font = cellFont;
    
    [cell.detailTextLabel setText:e.roman];
    cell.detailTextLabel.font = detailFont;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //NSLog(@"%@ / %@", e.wordSoundfile, e.imageFile);
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"selected!");
    
    // Navigation logic may go here. Create and push another view controller.
    
    ContentViewController *cvc = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];

    JPLetter *e = _letters[indexPath.row];
    
    cvc.letter = e;
    
    UIImage *img = nil;
    if (e.imageFile && [e.imageFile length] > 0) {
        img = [UIImage imageNamed:e.imageFile];
    }
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:cvc animated:YES];
    
    // set the visual changes
    if (img) {
        [cvc.image setImage:img];
    }

}

@end
