//
//  RoomPriceManager.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface RoomPriceManager : BaseNetManager
+(id)getWithPage:(NSInteger)page Cityarea:(NSString *)cityarea CityName:(NSString *)cityname  Date:(NSString *)date kCompletionHandle;
@end
