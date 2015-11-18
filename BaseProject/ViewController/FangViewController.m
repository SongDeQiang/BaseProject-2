//
//  FangViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FangViewController.h"
#import "RoomPriceController.h"
@interface FangViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webViewl;
@property (nonatomic ,strong)NSURLRequest *request;
@end

@implementation FangViewController
-(NSURLRequest *)request
{
    if (!_request) {
        NSURL *url=[NSURL URLWithString:@"http://www.fang.com"];
        _request=[NSURLRequest requestWithURL:url];

      
    }
    return _request;
}
-(UIWebView *)webViewl
{
    if (!_webViewl) {
      
        _webViewl=[[UIWebView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_webViewl];
        [_webViewl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _webViewl;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.webViewl.delegate=self;
    
   
    [self.webViewl loadRequest:self.request];

}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
         [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    
    
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    [self showProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    [self hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
