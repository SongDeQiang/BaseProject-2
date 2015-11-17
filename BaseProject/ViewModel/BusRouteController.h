//
//  BusRouteController.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviViewController.h"
@interface BusRouteController : UIViewController
+(NaviViewController *)navi;
@property (nonatomic ,strong)NSString *date;
@property (nonatomic ,strong)NSString *city;
@property (nonatomic ,strong)NSString *stationName;
@property (nonatomic )BOOL isnil;
@end
