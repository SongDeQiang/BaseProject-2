//
//  BaiduController.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiduController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface BaiduController ()<BMKMapViewDelegate>
@property (nonatomic ,strong)BMKMapView *mapView;
@property (nonatomic ,strong)CLLocationManager *manager;
@end

@implementation BaiduController
-(BMKMapView *)mapView
{
    if (_mapView==nil) {
        _mapView=[BMKMapView new];
        [self.view addSubview:_mapView];
        [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _mapView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _manager=[CLLocationManager new];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        [_manager requestWhenInUseAuthorization];
    }

   // 此处记得不用的时候需要置nil，否则影响内存的释放
    
    BMKPointAnnotation *point=[BMKPointAnnotation new];
    point.title=[NSString stringWithFormat:@"站点:%@", self.title1];
    point.subtitle=[NSString stringWithFormat:@"公交:%@",self.self.title2];
    
    point.coordinate=CLLocationCoordinate2DMake(self.Y  , self.X);
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:BMKCoordinateRegionMake(point.coordinate, BMKCoordinateSpanMake(0.001, 0.001)) animated:YES];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
 
     _mapView.delegate = self; 
    
  
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKUserLocation class]]) {
        return nil;
    }
    static NSString *idetify=@"annotiomView";
    BMKAnnotationView *view=[mapView dequeueReusableAnnotationViewWithIdentifier:idetify];
    if (!view) {
        view=[[BMKAnnotationView alloc]initWithAnnotation:nil reuseIdentifier:idetify]
        ;
        view.canShowCallout=YES;
           }
    view.image=[UIImage imageNamed:@"icon_mark1"];
    return view;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
