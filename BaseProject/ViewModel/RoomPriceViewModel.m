//
//  RoomPriceViewModel.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomPriceViewModel.h"
#import "RoomPrice.h"
#import "RoomPriceManager.h"
@implementation RoomPriceViewModel
-(id)initWithCityarea:(NSString *)cityarea City:(NSString *)city Date:(NSString *)date
{
    if (self=[super init]) {
        self.cityarea=cityarea;
        self.city=city;
        self.date=date;
    }
    return self;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
   _page=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (_maxPage==_page) {
        NSError *err=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更过数据"}];
        completionHandle(err);
    }else
    {
        _page+=1;
        _num+=20;
        [self getDataFromNetCompleteHandle:completionHandle];
       
    }
   
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask=[RoomPriceManager getWithPage:self.page Cityarea:self.cityarea CityName:self.city Date:self.date completionHandle:^(RoomPrice *model, NSError *error) {
      
       
            if (_page == 1) {
                [self.dataArr removeAllObjects];
            }
             [self.dataArr addObjectsFromArray:model.showapi_res_body.contents];
            self.maxPage=model.showapi_res_body.allpage ;
        self.page=model.showapi_res_body.nowpage;
        self.num=model.showapi_res_body.nowpagenum;
            completionHandle(error);
        
    
    }];
    
}
-(RoomPriceShowContents *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSURL *)imageURLRorRow:(NSInteger)row
{
    NSString *path=[self modelForRow:row].detailpic;
    return [NSURL URLWithString:path];
}
-(NSString *)areadetailForRow:(NSInteger)row
{
    return [self modelForRow:row].areadetail;
}

-(NSString *)areaNameForRow:(NSInteger)row
{
    return [self modelForRow:row].areaname;
}
-(NSString *)areaPriceForRow:(NSInteger)row
{
    return [self modelForRow:row].areaprice.stringValue;
}
-(NSString *)priceTrendForRow:(NSInteger)row
{
    return [self modelForRow:row].pricetrend;
}

@end
