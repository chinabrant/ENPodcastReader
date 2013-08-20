//
//  DetailViewController.m
//  ENPodcastReader
//
//  Created by wusj on 13-8-20.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "DetailViewController.h"
#import "ESLItem.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithESLItem:(ESLItem *)item {
    self = [super init];
    if (self) {
        eslItem = item;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = eslItem.title;
    
    UIScrollView *horScrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44)] autorelease];
    [horScrollView setContentSize:CGSizeMake(horScrollView.frame.size.width * 2, horScrollView.frame.size.height)];
    horScrollView.showsHorizontalScrollIndicator = NO;
    horScrollView.showsVerticalScrollIndicator = NO;
    horScrollView.pagingEnabled = YES;
    
    UILabel *descriptionLabel = [[[UILabel alloc] initWithFrame:CGRectMake(horScrollView.frame.size.width, 0, horScrollView.frame.size.width, horScrollView.frame.size.height)] autorelease];
    descriptionLabel.text = [[[eslItem.description stringByReplacingOccurrencesOfString:@"<p>" withString:@""] stringByReplacingOccurrencesOfString:@"</p>" withString:@""] stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    descriptionLabel.numberOfLines = 0;
    [horScrollView addSubview:descriptionLabel];
    
    [self.view addSubview:horScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
