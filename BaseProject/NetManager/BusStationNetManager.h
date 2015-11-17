//
//  BusStationNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface BusStationNetManager : BaseNetManager
+(id)getStationWith:(NSString *)stationName City:(NSString *)city Date:(NSString *)date kCompletionHandle;
@end
