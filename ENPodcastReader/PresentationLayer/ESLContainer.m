//
//  ESLContainer.m
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "ESLContainer.h"
#import "XMLPaster.h"
#import "ESLItem.h"

static ESLContainer *instance = nil;

@implementation ESLContainer

@synthesize eslArray;

+ (ESLContainer *)instance {
    if (!instance) {
        
        instance = [[super allocWithZone:NULL] init];
    }
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self instance];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)init {
    if (instance) {
        return instance;
    }
    self = [super init];
    if (self) {
        XMLPaster *paster = [[XMLPaster alloc] init];
        self.eslArray = [[paster parserPast] retain];
    }
    
    return self;
}

- (id)retain {
    return self;
}

- (oneway void)release {
    // Do nothing
}

- (id)autorelease {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (NSMutableArray *)searchByNumber:(NSString *)number {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.eslArray count]; i++) {
        ESLItem *item = (ESLItem *) [self.eslArray objectAtIndex:i];
        if ([item.title rangeOfString:number].length > 0) {
            [data addObject:item];
        }
    }
    
    return [data autorelease];
}

@end
