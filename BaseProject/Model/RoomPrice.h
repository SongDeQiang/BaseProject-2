//
//  RoomPrice.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class RoomPriceShow,RoomPriceShowContents;
@interface RoomPrice : BaseModel

@property (nonatomic, strong) RoomPriceShow *showapi_res_body;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, assign) NSInteger showapi_res_code;

@end
@interface RoomPriceShow : NSObject

@property (nonatomic) NSInteger allnum;

@property (nonatomic)  NSInteger nowpage;

@property (nonatomic, assign) NSInteger nowpagenum;

@property (nonatomic, strong) NSArray<RoomPriceShowContents *> *contents;

@property (nonatomic) NSInteger allpage;

@property (nonatomic, copy) NSString *errormsg;

@property (nonatomic, copy) NSString *ret_code;

@end

@interface RoomPriceShowContents : NSObject

@property (nonatomic, copy) NSString *areadetail;

@property (nonatomic, copy) NSString *areaname;

@property (nonatomic,copy) NSNumber *areaprice;

@property (nonatomic, copy) NSString *cityarea;

@property (nonatomic, copy) NSString *cityname;

@property (nonatomic, copy) NSString *detailpic;

@property (nonatomic, copy) NSString *pricetrend;

@end

