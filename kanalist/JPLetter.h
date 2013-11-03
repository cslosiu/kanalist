//
//  JPLetter.h
//  kanalist
//
//  Created by siu on 13年6月2日.
//  Copyright (c) 2013年 siu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPLetter : NSObject {
    
}

@property (nonatomic, retain) NSString *roman;
@property (nonatomic, retain) NSString *hiragana; // 平假名
@property (nonatomic, retain) NSString *katakana; // 片假名
@property (nonatomic, retain) NSString *wordsound; // word pronounciation filename
@property (nonatomic, retain) NSString *image; // image base filename
@property (nonatomic, retain) NSString *word; // japanese word

-(NSString*) kanaSoundfile;
-(NSString*) wordSoundfile;
-(NSString*) imageFile;

@end
