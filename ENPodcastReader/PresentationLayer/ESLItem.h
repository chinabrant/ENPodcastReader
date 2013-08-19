//
//  ESLItem.h
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESLItem : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *mp3Url;
@property (nonatomic) float length;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic) int number;

@end
