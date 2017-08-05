//
//  MJCTestTableViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestTableViewController.h"
#import "MJCPrefixHeader.pch"

@interface MJCTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MJCTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger tag  = arc4random() % 9;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%ld",tag]]];
    
    self.tableView.backgroundColor = [UIColor purpleColor];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData) ];
    self.tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData) ];
}

-(void)beginLoadNewData
{
    [self.tableView.mj_header beginRefreshing];
}

-(void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
    NSLog(@"heihei");
}

-(void)loadMoreData
{
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
    });
}

#pragma mark - UITableviewdatasource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.title];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"我是第%ld组",section];
}



@end
