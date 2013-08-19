//
//  ESLContainer.h
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESLContainer : NSObject

@property (nonatomic, retain) NSMutableArray *eslArray;

+ (ESLContainer *)instance;
- (NSMutableArray *)searchByNumber:(NSString *)number;

@end
