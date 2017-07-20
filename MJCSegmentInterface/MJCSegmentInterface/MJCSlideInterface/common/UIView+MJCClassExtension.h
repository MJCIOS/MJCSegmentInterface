//
//  UIView+MJCExtension.h
//
//  Created by majiachen on 16/11/6.
//  Copyright © 2016年 majiachen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MJCClassExtension)
@property (nonatomic, assign) CGSize jc_size;//尺寸
@property (nonatomic, assign) CGFloat jc_width;//宽度
@property (nonatomic, assign) CGFloat jc_height;//高度
@property (nonatomic, assign) CGFloat jc_x;//X
@property (nonatomic, assign) CGFloat jc_y;//y
@property (nonatomic, assign) CGFloat jc_centerX;//X中心
@property (nonatomic, assign) CGFloat jc_centerY;//Y中心
@property (nonatomic, assign) CGFloat jc_right;//右边
@property (nonatomic, assign) CGFloat jc_bottom;//底部
@end
