//
//  SFScrollLabel.h
//  SFScrollLabel
//
//  Created by shefeng on 2022/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,SFScrollLabelDirection){
    //向左
    SFScrollLabelDirectionLeft = 0,
    //向右
    SFScrollLabelDirectionRight = 1,
};

@interface SFScrollLabel : UIScrollView <UIScrollViewDelegate>

/**
 *  配置属性
 *  @param text 文本
 *  @param textFont 文本字体
 *  @param textColor 文本颜色
 *  @param scrollDirection 滚动方向
 *  @param scrollSpeed 滚动速度
 */
- (void)config:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor scrollDirection:(SFScrollLabelDirection)scrollDirection scrollSpeed:(CGFloat)scrollSpeed;

/**
 *  开始滚动
 */
- (void)startScroll;

/**
 *  停止滚动
 */
- (void)stopScroll;

@end

NS_ASSUME_NONNULL_END
