//
//  DetailViewController.h
//  ENPodcastReader
//
//  Created by wusj on 13-8-20.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ESLItem;

@interface DetailViewController : UIViewController {
    ESLItem *eslItem;
}


- (id)initWithESLItem:(ESLItem *)item;

@end
