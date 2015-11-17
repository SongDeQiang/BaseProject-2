//
//  BusStationViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BusStationViewModel.h"
#import "BusStationNetManager.h"
#import "BusStationModel.h"
@implementation BusStationViewModel
-(NSInteger)rowNumeber
{
    return self.dataArr.count;
}
-(id)initWithCity:(NSString *)city StationName:(NSString *)stationName Date:(NSString *)date
{
    if (self=[super init]) {
        self.city=city;
        self.stationName=stationName;
        self.date=date;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
   self.dataTask= [BusStationNetManager getStationWith:_stationName City:_city Date:_date completionHandle:^(BusStationModel *model, NSError *error) {
       if (error) {
           NSError *err=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有此站点"}];
           completionHandle(err);
       }else
       {
        self.dataArr=model.showapi_res_body.retList.mutableCopy;
        completionHandle(error);
       }
    }];
}
-(BusStationShowRetlist *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
    
    
}
-(NSString *)getLine_namesForRow:(NSInteger)row
{
    return [self modelForRow:row].line_names;
}
-(BOOL)isNilForRow:(NSInteger)row
{
    return [self getLine_namesForRow:row];
}
-(NSString *)nameForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
}
-(CGFloat )getXForRow:(NSInteger)row
{
    NSString *X=[self modelForRow:row].xy;
    NSCharacterSet *charecterset1=[NSCharacterSet characterSetWithCharactersInString:@","];
    NSArray *arr=[X componentsSeparatedByCharactersInSet:charecterset1];
    return [arr[0] doubleValue];
}
-(CGFloat)getYForRow:(NSInteger)row
{
    NSString *Y=[self modelForRow:row].xy;
    NSCharacterSet *charecterset1=[NSCharacterSet characterSetWithCharactersInString:@","];
    NSArray *arr=[Y componentsSeparatedByCharactersInSet:charecterset1];
    return [arr[1] doubleValue];
    
}
@end
