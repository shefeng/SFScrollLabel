//
//  SFViewController.m
//  SFScrollLabel
//
//  Created by shefeng on 05/26/2022.
//  Copyright (c) 2022 shefeng. All rights reserved.
//

#import "SFViewController.h"

#import <SFScrollLabel.h>

@interface SFViewController ()

@property (strong, nonatomic) SFScrollLabel *scrollLabel;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat btnWidth = (viewWidth - 20 - 20 - 40)/2.f;
    CGFloat btnHeight = 40;
    
    UIButton *leftScrollBtn = [[UIButton alloc] init];
    leftScrollBtn.frame = CGRectMake(20, 100,btnWidth , btnHeight);
    leftScrollBtn.layer.borderColor = [UIColor blueColor].CGColor;
    leftScrollBtn.layer.borderWidth = .5;
    leftScrollBtn.layer.cornerRadius = 4;
    leftScrollBtn.layer.masksToBounds = YES;
    [leftScrollBtn setTitle:@"文字长向左滚动" forState:UIControlStateNormal];
    [leftScrollBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftScrollBtn addTarget:self action:@selector(longAndLeftScrollAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftScrollBtn];
    
    UIButton *notScrollBtn = [[UIButton alloc] init];
    notScrollBtn.frame = CGRectMake(20, 160, 200, btnHeight);
    notScrollBtn.layer.borderColor = [UIColor blueColor].CGColor;
    notScrollBtn.layer.borderWidth = .5;
    notScrollBtn.layer.cornerRadius = 4;
    notScrollBtn.layer.masksToBounds = YES;
    [notScrollBtn setTitle:@"文字短左右方向不滑" forState:UIControlStateNormal];
    [notScrollBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [notScrollBtn addTarget:self action:@selector(shortAndNotScrollAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:notScrollBtn];
    
    UIButton *rightScrollBtn = [[UIButton alloc] init];
    rightScrollBtn.frame = CGRectMake(20 + btnWidth + 40, 100, btnWidth, btnHeight);
    rightScrollBtn.layer.borderColor = [UIColor blueColor].CGColor;
    rightScrollBtn.layer.borderWidth = .5;
    rightScrollBtn.layer.cornerRadius = 4;
    rightScrollBtn.layer.masksToBounds = YES;
    [rightScrollBtn setTitle:@"文字长向右滚动" forState:UIControlStateNormal];
    [rightScrollBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightScrollBtn addTarget:self action:@selector(longAndRightScrollAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:rightScrollBtn];
    
    self.scrollLabel = [[SFScrollLabel alloc] init];
    self.scrollLabel.frame = CGRectMake(50, 300, 200, 20);
    self.scrollLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.scrollLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  文字长向左滑动
 */
- (void)longAndLeftScrollAction:(UIButton *)btn{
    [self.scrollLabel config:@"向左滚动向左滚动向左滚动向左滚动向左滚动向左滚动" textFont:[UIFont systemFontOfSize:16] textColor:[UIColor redColor] scrollDirection:SFScrollLabelDirectionLeft scrollSpeed:30];
    [self.scrollLabel startScroll];
}

/**
 *  文字短不滑
 */
- (void)shortAndNotScrollAction:(UIButton *)btn{
    [self.scrollLabel config:@"文字短不滑" textFont:[UIFont systemFontOfSize:16] textColor:[UIColor redColor] scrollDirection:SFScrollLabelDirectionRight scrollSpeed:30];
    [self.scrollLabel startScroll];
}

/**
 *  文字长向右滑动
 */
- (void)longAndRightScrollAction:(UIButton *)btn{
    [self.scrollLabel config:@"向右向右向右向右向右向右向右向右向右向右向右向右向" textFont:[UIFont systemFontOfSize:16] textColor:[UIColor redColor] scrollDirection:SFScrollLabelDirectionRight scrollSpeed:30];
    [self.scrollLabel startScroll];
}

@end
