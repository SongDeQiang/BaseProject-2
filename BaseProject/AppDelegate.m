//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "ViewController.h"
#import "TabBarConttroller.h"
#import "LeftViewController.h"
#import "RoomPriceManager.h"

#import "BusStationNetManager.h"
#import "BusStationViewModel.h"

#define BaiduAK @"FfClOXAzuLCGKm3NAT5kCSPn"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
   
    __mapManager=[[BMKMapManager alloc]init];
    BOOL ret=[__mapManager start:BaiduAK generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed");
    }
    self.window.rootViewController=[TabBarConttroller new];
    return YES;
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}
-(UIWindow *)window
{
    if (!_window) {
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor=[UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}

//-(RESideMenu *)sideMenu{
//    if (!_sideMenu) {
//        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[ViewController defaultNavi] leftMenuViewController: [LeftViewController navi] rightMenuViewController:nil];
//        _sideMenu.backgroundImage=[UIImage imageNamed:@"1420510116_DWSMLsAt"];
//        _sideMenu.menuPrefersStatusBarHidden=YES;
//        _sideMenu.bouncesHorizontally=NO;
//    }
//    return _sideMenu;
//}
@end
