//
//  ESLListViewController.h
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "BaseViewController.h"
@class ESLContainer;

@interface ESLListViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *dataArray;
    ESLContainer *esl;
}

@end
