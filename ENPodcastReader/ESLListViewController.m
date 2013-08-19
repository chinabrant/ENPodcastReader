//
//  ESLListViewController.m
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-19.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "ESLListViewController.h"
#import "XMLPaster.h"
#import "ESLContainer.h"

@interface ESLListViewController ()

@end

@implementation ESLListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        esl = [ESLContainer instance];
        dataArray = esl.eslArray;
        if (esl.eslArray != nil) {
            NSLog(@"######## ===> right <=== #######");
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITextField *field = [[[UITextField alloc] initWithFrame:CGRectMake(10, 5, 200, 25)] autorelease];
    field.tag = 101;
    field.placeholder = @"请输入关键字或数字";
    field.backgroundColor = [UIColor grayColor];
    [self.view addSubview:field];
    
    UIButton *searchButton = [[[UIButton alloc] initWithFrame:CGRectMake(220, 5, 90, 25)] autorelease];
    [searchButton addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setTitle:@"Search" forState:UIControlStateNormal];
    searchButton.backgroundColor = [UIColor purpleColor];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:searchButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)clickSearch {
    
    UITextField *field = (UITextField *) [self.view viewWithTag:101];
    [field resignFirstResponder];
    if (field.text == nil || [field.text isEqualToString:@""]) {
        dataArray = esl.eslArray;
    } else {
        dataArray = [[esl searchByNumber:field.text] retain];
    }
    
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier] autorelease];
    }
    
    cell.textLabel.text = ((ESLItem *) [dataArray objectAtIndex:indexPath.row]).title;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

@end
