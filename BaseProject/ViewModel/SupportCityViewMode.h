//
//  SupportCityViewMode.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "SupportCity.h"
@interface SupportCityViewMode : BaseViewModel
-(id)initWithDate:(NSString *)date;
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic ,strong)NSString *date;
-(NSArray *)WithForRow;
-(NSString *)nameForRow:(NSInteger)row;
@property (nonatomic ,strong)SupportCity *content;
@end
