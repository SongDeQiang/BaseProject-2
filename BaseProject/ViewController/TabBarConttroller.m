//
//  TabBarConttroller.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TabBarConttroller.h"
#import "LeftViewController.h"
#import "BusRouteController.h"
@interface TabBarConttroller ()

@end

@implementation TabBarConttroller
+(void)initialize
{
    UITabBar *tabBar=[UITabBar appearance];
    tabBar.barTintColor=kRGBColor(239, 232, 211);
    tabBar.tintColor=[UIColor blackColor];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController *navi1=[LeftViewController navi];
    UINavigationController *navi2=[BusRouteController navi];
    self.viewControllers=@[navi1,navi2];
    self.tabBar.translucent=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
