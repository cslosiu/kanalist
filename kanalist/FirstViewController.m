//
//  FirstViewController.m
//  kanalist
//
//  Created by siu on 13年5月27日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
//        self.tabBarItem.title = NSLocalizedString(@"Info", @"Info");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIDevice *device = [UIDevice currentDevice];
    if (![[device model] isEqualToString:@"iPhone"] ) {
        self.callButton.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) callPhone:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *url=[NSString stringWithFormat:@"tel:31767108"];
        [[UIApplication sharedApplication ]openURL:[NSURL URLWithString:url]];
    }
}

-(void) openSite:(id)sender {
    NSString *url=[NSString stringWithFormat:@"http://www.todaimae.com"];
    [[UIApplication sharedApplication ]openURL:[NSURL URLWithString:url]];
}

@end
