//
//  IIViewDeckController+Category.m
//  CostList
//
//  Created by 许德鸿 on 2016/10/18.
//  Copyright © 2016年 XuDeHong. All rights reserved.
//

#import "IIViewDeckController+Category.h"
#import "SearchViewController.h"

@implementation IIViewDeckController (Category)

- (UIStatusBarStyle)preferredStatusBarStyle //侧栏效果控制器作为根视图控制器，会自动调用这个方法
{
    if(self.openLeftView)
        return UIStatusBarStyleDefault;     //侧栏显示时状态栏为黑色
    else
    {
        if([self.presentedViewController isKindOfClass:[SearchViewController class]])
        {
            SearchViewController *controller = (SearchViewController *)self.presentedViewController;
            if((controller != nil) && (controller.isVisible == YES))
            {
                return UIStatusBarStyleDefault; //如果是搜索控制器，则显示黑色
            }
            else
                return UIStatusBarStyleLightContent;
        }
        return UIStatusBarStyleLightContent;    //侧栏显示时状态栏为白色
    }
}

-(BOOL)prefersStatusBarHidden
{
    return NO;  //不隐藏状态栏
}

@end
