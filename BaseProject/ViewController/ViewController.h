//
//  ViewController.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
+(UINavigationController *)defaultNavi;
-(id)initWithName:(NSString *)name;
@property (nonatomic ,strong)NSString *date1;
@property (nonatomic ,strong)NSString *name;
@end
