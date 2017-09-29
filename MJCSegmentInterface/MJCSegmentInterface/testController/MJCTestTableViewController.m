//
//  MJCTestTableViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestTableViewController.h"
#import "MJCPrefixHeader.pch"
#import "MJCTestPushVC.h"


#define oriHeight 180

@interface MJCTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MJCTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = MJCRandomColor;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData) ];
    self.tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData) ];
}

-(void)setTestData:(NSString *)testData
{
    _testData = testData;
    NSLog(@"%@",testData);
}

-(void)beginLoadNewData:(NSMutableDictionary *)dicData;
{
    NSLog(@"我获取到数据啦,✌️%@",dicData);
    [self.tableView.mj_header beginRefreshing];
}

-(void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
    NSLog(@"刷新最新数据啦,哦哦哦哦");
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJCTestPushVC *vc = [[MJCTestPushVC alloc]jc_initWithSureBtnClickBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"switchSegmentPage" object:nil];
    }];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"我是第%ld组",section];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    
    CGFloat h = oriHeight - offset;
    if (h <= 0) {
        h = 0;
    }
    _heightLayout.constant = h;
}

-(void)dealloc
{
    NSLog(@"%@销毁",self);
}


@end
