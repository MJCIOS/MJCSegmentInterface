//
//  MJCRightMostButton.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/1/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"


@interface MJCRightMostButton : UIButton

@property (nonatomic,strong) UIColor *rightBtnBackColor;

@property (nonatomic,assign) BOOL rightBtnHidden;

@property (nonatomic,assign) CGRect rightMostBtnFrame;

@property (nonatomic,strong) UIImage *rightMostBtnImage;


-(void)setupRightFrame:(UIButton *)titlesButton titlesScrollView:(UIScrollView *)titlesScrollView;

@end
