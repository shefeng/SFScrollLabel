//
//  SFScrollLabel.m
//  SFScrollLabel
//
//  Created by shefeng on 2022/5/9.
//

#import "SFScrollLabel.h"

#import <Masonry/Masonry.h>

@interface SFScrollLabel ()

//UI
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *firstLab;
@property (strong, nonatomic) UILabel *secondLab;

//滚动速度
@property (assign, nonatomic) CGFloat scrollSpeed;
//滚动方向
@property (assign, nonatomic) enum SFScrollLabelDirection scrollDirection;
//是否正在滚动
@property (assign, nonatomic) BOOL isScrolling;
//label的宽度
@property (assign, nonatomic) CGFloat labelWidth;
//label的间距
@property (assign, nonatomic) CGFloat labelSpace;

@end

@implementation SFScrollLabel

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setupUI];
    }
    return self;
}
 
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.userInteractionEnabled = NO;
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset = 0;
    }];
    
    [self.contentView addSubview:self.firstLab];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset = 0;
    }];
    
    [self.contentView addSubview:self.secondLab];
    [self.secondLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset = 0;
        make.left.mas_equalTo(self.firstLab.mas_right).offset = 0;
    }];
}

/**
 *  配置属性
 *  @param text 文本
 *  @param textFont 文本字体
 *  @param textColor 文本颜色
 *  @param scrollDirection 滚动方向
 *  @param scrollSpeed 滚动速度
 */
- (void)config:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor scrollDirection:(SFScrollLabelDirection)scrollDirection scrollSpeed:(CGFloat)scrollSpeed{
    
    self.labelWidth = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : textFont} context:nil].size.width;
    
    self.labelSpace = self.frame.size.width / 2.f;
    
    self.contentSize = CGSizeMake(self.labelWidth * 2 + self.labelSpace * 2, self.frame.size.height);
    
    self.scrollDirection = scrollDirection;
    self.scrollSpeed = scrollSpeed;
    
    self.firstLab.text = text;
    self.firstLab.textColor = textColor;
    self.firstLab.font = textFont;
    
    self.secondLab.text = text;
    self.secondLab.textColor = textColor;
    self.secondLab.font = textFont;
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset = self.frame.size.height;
    }];
    
    [self.firstLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset = 0;
        make.centerY.offset = 0;
    }];
    [self.secondLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.offset = 0;
        make.left.mas_equalTo(self.firstLab.mas_right).offset = self.labelSpace;
        make.centerY.offset = 0;
        make.right.offset = -self.labelSpace;
    }];
    
    if(self.frame.size.width > self.labelWidth){
        self.secondLab.text = @"";
    }else{
        self.secondLab.text = text;
    }
}

/**
 *  开始滚动
 */
- (void)startScroll{
    
    [self stopScroll];
    
    if(self.frame.size.width > self.labelWidth){
        return;
    }
    
    if(self.isScrolling){
        return;
    }
    
    if (self.scrollDirection == SFScrollLabelDirectionLeft){
        [self setContentOffset:CGPointMake(0,0) animated:NO];
    }else{
        [self setContentOffset:CGPointMake(self.labelWidth + self.labelSpace,0) animated:NO];
    }
    
    [UIView beginAnimations:@"scroll" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDuration:self.labelWidth/self.scrollSpeed];
    
    if (self.scrollDirection == SFScrollLabelDirectionLeft){
        [self setContentOffset:CGPointMake(self.labelWidth + self.labelSpace,0) animated:NO];
    }else{
        [self setContentOffset:CGPointMake(0,0) animated:NO];
    }
    
    [UIView commitAnimations];
}

/**
 *  停止滚动
 */
- (void)stopScroll{
    [self setContentOffset:CGPointMake(0,0) animated:NO];
    [self.layer removeAllAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    self.isScrolling = NO;
 
    if ([finished intValue] == 1 && self.labelWidth > self.frame.size.width){
        [self startScroll];
    }
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

- (UILabel *)firstLab{
    if (!_firstLab) {
        _firstLab = [UILabel new];
    }
    return _firstLab;
}

- (UILabel *)secondLab{
    if (!_secondLab) {
        _secondLab = [UILabel new];
    }
    return _secondLab;
}

@end
