//
//  BusStationNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BusStationNetManager.h"
#import "BusStationModel.h"
@implementation BusStationNetManager
+(id)getStationWith:(NSString *)stationName City:(NSString *)city Date:(NSString *)date completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=[NSString stringWithFormat:@"https://route.showapi.com/844-1?city=%@&showapi_appid=12153&showapi_timestamp=%@&station=%@&showapi_sign=b75352417e11470a8fbcf41dc96a8579",city,date,stationName];
    path=[self percentPathWithPath:path params:nil];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BusStationModel mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
