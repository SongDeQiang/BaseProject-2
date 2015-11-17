//
//  RoomPriceManager.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomPriceManager.h"
#import "RoomPrice.h"
@implementation RoomPriceManager
+(id)getWithPage:(NSInteger)page Cityarea:(NSString *)cityarea CityName:(NSString *)cityname Date:(NSString *)date kCompletionHandle
{
    NSString *path=[NSString stringWithFormat:@"http://route.showapi.com/585-1?cityarea=%@&cityname=%@&page=%ld&showapi_appid=12153&showapi_timestamp=%@&type=1&showapi_sign=b75352417e11470a8fbcf41dc96a8579",cityarea,cityname,page,date];
    path=[self percentPathWithPath:path params:nil];
   return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RoomPrice mj_objectWithKeyValues:responseObj],error);
    }];
    
}
@end
