//
//  RoomPriceViewModel.h
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RoomPrice.h"
@interface RoomPriceViewModel : BaseViewModel
-(id)initWithCityarea:(NSString *)cityarea City:(NSString *)city Date:(NSString *)date;
@property (nonatomic)NSInteger page;
@property (nonatomic ,strong)NSString *date;
@property (nonatomic ,strong)NSString *cityarea;
@property (nonatomic ,strong)NSString *city;
@property (nonatomic)NSInteger rowNumber;
@property (nonatomic)NSInteger maxPage;
-(NSURL *)imageURLRorRow:(NSInteger)row;
-(NSString *)areadetailForRow:(NSInteger)row;
-(NSString *)areaNameForRow:(NSInteger)row;
-(NSString *)areaPriceForRow:(NSInteger)row;
-(NSString *)priceTrendForRow:(NSInteger)row;
-(NSInteger )pageForRow:(NSInteger)row;
@property (nonatomic ,strong)RoomPrice *model;
@property (nonatomic)NSInteger num;
@property (nonatomic ,strong)NSArray *priceArr;
@end
