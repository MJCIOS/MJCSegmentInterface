//
//  MJCOrdinaryLayout.h
//  MJC
//
//  Created by mjc on 16/12/2.
//
//

#import <UIKit/UIKit.h>

@interface MJCOrdinaryLayout : UICollectionViewFlowLayout

/** 滚动方向 */
@property (nonatomic) UICollectionViewScrollDirection srollingDirection;

#pragma mark -- UICollectionViewScrollDirectionHorizontal(平行滚动)
/** 默认的显示的数量 */
@property (nonatomic,assign) NSInteger hlitemShowMaxCount;
/** 最左边的间距 */
@property (nonatomic,assign) CGFloat hlitemMaxLeftMargin;
/** 最右边的间距 */
@property (nonatomic,assign) CGFloat hlitemMaxRightMargin;
/** 最顶部的间距 */
@property (nonatomic,assign) CGFloat hlitemMaxTopMargin;
/** 最底部的间距 */
@property (nonatomic,assign) CGFloat hlitemMaxBottomMargin;
/** item之间每一列中间的间距 */
@property (nonatomic,assign) CGFloat hlitemLineMargin;


#pragma mark -- UICollectionViewScrollDirectionVertical(垂直滚动)
/** 默认的最大列数量 */
@property (nonatomic,assign) NSInteger vlitemLineMaxCount;
/** item的高度 */
@property (nonatomic,assign) CGFloat vlitemHegight;
/** item之间每一列中间的间距 */
@property (nonatomic,assign) CGFloat vlitemLineMargin;
/** item之间每一行中间的间距 */
@property (nonatomic,assign) CGFloat vlitemRowMargin;
/** 最左边的间距 */
@property (nonatomic,assign) CGFloat vlitemMaxLeftMargin;
/** 最右边的间距 */
@property (nonatomic,assign) CGFloat vlitemMaxRightMargin;
/** 最顶部的间距 */
@property (nonatomic,assign) CGFloat vlitemMaxTopMargin;
/** 最底部的间距 */
@property (nonatomic,assign) CGFloat vlitemMaxBottomMargin;



@end
