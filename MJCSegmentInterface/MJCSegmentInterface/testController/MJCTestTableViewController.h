//
//  MJCTestTableViewController.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJCTestTableViewController : UITableViewController

-(void)beginLoadNewData:(NSMutableDictionary *)dicData;

@property (weak, nonatomic)  NSLayoutConstraint *heightLayout;

/** <#  注释  #> */
@property (nonatomic,strong) NSArray *mainDataArr;


@end
