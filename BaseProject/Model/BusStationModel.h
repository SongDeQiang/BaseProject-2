//
//  BusRouteModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class BusStationModelShow,BusStationShowRetlist;
@interface BusStationModel : BaseModel

@property (nonatomic, strong) BusStationModelShow *showapi_res_body;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, assign) NSInteger showapi_res_code;

@end

@interface BusStationModelShow : NSObject

@property (nonatomic, strong) NSArray<BusStationShowRetlist *> *retList;

@property (nonatomic, assign) NSInteger ret_code;

@end

@interface BusStationShowRetlist : NSObject

@property (nonatomic, copy) NSString *line_names;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *xy;

@end

