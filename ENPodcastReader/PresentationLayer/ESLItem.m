//
//  ESLItem.m
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "ESLItem.h"

@implementation ESLItem

@synthesize title;
@synthesize description;
@synthesize mp3Url;
@synthesize pubDate;
@synthesize length;
@synthesize number;

- (void)dealloc
{
    [title release];
    [description release];
    [mp3Url release];
    [pubDate release];
    [super dealloc];
}

@end
