//
//  BaseViewController.h
//  MyClassOver
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic,strong)UIButton *leftbarItem;
@property (nonatomic,assign)BOOL isCustom;
//显示菊花
- (void)showProgress;

//显示菊花 title
- (void)showProgressTitle:(NSString *)title;

//隐藏菊花
- (void)hideProgress;
//切换导航颜色
-(void)changeNavBg;
//还原导航颜色
-(void)restoreNavBg;

- (void)backClick;
//- (void)showNoDataView:(BOOL)isShow title:(NSString *)title;

- (void)showNoDataView:(BOOL)isShow title:(NSString *)title WithY:(NSInteger)Y;
@end
