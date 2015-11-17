//
//  SupportCityViewMode.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SupportCityViewMode.h"
#import "SupportCityManager.h"
#import "SupportCity.h"
@implementation SupportCityViewMode
-(id)initWithDate:(NSString *)date
{
    if (self=[super init]) {
        self.date=date;
    }
    return self;
}
-(NSInteger)rowNumber
{
   return  self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask=[SupportCityManager getDate:self.date completionHandle:^(SupportCity *model, NSError *error) {
        
        self.dataArr=model.showapi_res_body.contents.mutableCopy;
        self.content=model;
        completionHandle(error);
        
    }];
}
-(NSString *)nameForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSArray *)WithForRow
{
    return self.dataArr;
}
@end
