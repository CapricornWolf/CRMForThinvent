//
//  BasicControls.h
//  MasterplateDemo
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicControls : NSObject


+(UITextField  *)createTextFieldWithframe:(CGRect)rect
                                addTarget:(id)target
                                    image:(UIImage *)backGroudImage;

+ (void)setLeftImageViewToTextField:(UITextField *)field;

+(UIImage *)getImageWithName:(NSString *)imageName type:(NSString *)imageType;

+(UILabel  *)createLabelWithframe:(CGRect)rect
                            image:(UIImage *)backGroudImage;

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text;

+(void)showAlertWithMsg:(NSString *)msg
              addTarget:(id)target;

+(UIImageView  *)createImageViewWithframe:(CGRect )rect
                                    image:(UIImage *)backGroudImage;

+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)name;

+(UIButton  *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect )rect
                              image:(UIImage *)backGroudImage;
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title;


+ (BOOL)isNewVersion;
@end
