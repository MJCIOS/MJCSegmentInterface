//
//  MJCChildScrollView.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCTabItem.h"

@interface MJCChildMainView : UIScrollView
@property (nonatomic,weak) NSArray *childControllerArray;
@property (nonatomic,strong) NSMutableArray *childViewArray;
@property (nonatomic,weak) UIViewController *hostController;
- (void)addChildVcView;
- (void)addAllChildVcView;
-(void)setupChildViewHeightisLoadDefaultChildVC:(BOOL)isLoadDefaultChildVC;
@property (nonatomic,strong) MJCTabItem *titlesTabItem;
@property (nonatomic,strong) MJCTabItem *defaulTabItem;
-(void)setupContenSizeWithTitlesArr:(NSArray *)titlesArr mainView:(UIView*)mainView;
@property(nonatomic,assign) BOOL isChildScollAnimal;
@property (nonatomic,assign) BOOL isChildScollEnabled;
@property (nonatomic,assign) BOOL bouncesEnabled;
@property (nonatomic,weak) UIView *customChildBackView;
@end
