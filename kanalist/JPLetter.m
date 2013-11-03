//
//  JPLetter.m
//  kanalist
//
//  Created by siu on 13年6月2日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import "JPLetter.h"

@implementation JPLetter

-(NSString*) kanaSoundfile {
    return [NSString stringWithFormat:@"%@", self.roman];
}

-(NSString*) wordSoundfile {
    return [NSString stringWithFormat:@"%@", self.wordsound];
}

-(NSString*) imageFile {
    return [NSString stringWithFormat:@"%@.png", self.image];
}

@end
