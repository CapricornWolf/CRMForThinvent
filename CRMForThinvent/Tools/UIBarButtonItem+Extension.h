//
//  UIBarButtonItem+Extension.h
//  MasterplateDemo
//
//  Created by diudiu on 15/7/13.
//  Copyright (c) 2015年 diudiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

@end
