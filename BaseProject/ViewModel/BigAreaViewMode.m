//
//  BigAreaViewMode.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BigAreaViewMode.h"
#import "BigManager.h"
#import "ChectOutBigArea.h"

@implementation BigAreaViewMode
-(instancetype)initWith:(NSString *)date Name:(NSString *)name
{
    if (self=[super init]) {
        self.date=date;
        self.name=name;
    }
    return self;
}
-(NSInteger)rowNumeber
{
   return  self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask=[BigManager getBigArea:self.name Date:self.date completionHandle:^(ChectOutBigArea *model, NSError *error) {
        self.dataArr=model.showapi_res_body.contents.mutableCopy;
        completionHandle(error);
   }];
    
}
-(NSArray *)AreaForRow;
{
    return self.dataArr;
}
@end
