//
//  BusStationViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface BusStationViewModel : BaseViewModel
@property (nonatomic)NSInteger rowNumeber;
-(CGFloat)getXForRow:(NSInteger)row;
-(CGFloat)getYForRow:(NSInteger)row;
-(NSString *)getLine_namesForRow:(NSInteger)row;
-(NSString *)nameForRow:(NSInteger)row;
-(id)initWithCity:(NSString *)city StationName:(NSString *)stationName Date:(NSString *)date;
@property (nonatomic ,strong)NSString *city;
@property (nonatomic ,strong)NSString *stationName;
@property (nonatomic ,strong)NSString *date;
-(BOOL)isNilForRow:(NSInteger)row;
@end
