//
//  MJCSpecialMainVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialMainVC.h"

#import "MJCInterfaceTools.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialMainVC ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSpecialMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"specialVCData" ofType:@"plist"];
    _mainArr = [NSArray arrayWithContentsOfFile:path];
    self.tableView.backgroundColor = MJCRandomColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableviewdatasource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _mainArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = _mainArr[indexPath.row][@"titles"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [MJCInterfaceTools setupViewControllersStr:_mainArr[indexPath.row][@"viewControllers"]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
