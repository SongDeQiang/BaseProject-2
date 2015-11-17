//
//  LeftViewController.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviViewController.h"
@interface LeftViewController : UIViewController
@property (nonatomic,strong)NSString *date;
+(NaviViewController *)navi;

@property (nonatomic ,strong)UITableView *tableView;
@end
