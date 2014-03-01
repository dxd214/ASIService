//
//  ViewController.m
//  ASIService
//
//  Created by Width on 14-2-28.
//  Copyright (c) 2014年 mojingtao. All rights reserved.
//

#import "ViewController.h"
#import "SGDataService.h"
#import "SBJsonWriter.h"

#define BASEURL     @"http://192.168.1.83:9000/Assistant/app"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self start];
}
- (void)start
{
    //NSString *postString = @"{\"actionCode\":\"441\" , \"appType\":\"json\",\"companyId\":\"00000101\"}";
    NSArray *arrValue = @[@"441",@"json",@"00000101"];
    NSArray *arrKeys = @[@"actionCode",@"appType",@"companyId"];
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObjects:arrValue forKeys:arrKeys];
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    
    NSString *jsonStr = [jsonWriter stringWithObject:dic];
    NSLog(@"%@",jsonStr);
    
    
   

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
