//
//  MJCTestViewController1.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestViewController1.h"
#import "MJCPrefixHeader.pch"

@interface MJCTestViewController1 ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation MJCTestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testTableView.backgroundColor = MJCRandomColor;
}

#pragma mark - UITableviewdatasource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.title];
    return cell;
}

-(void)dealloc
{
    NSLog(@"%@销毁",self);
}



@end
