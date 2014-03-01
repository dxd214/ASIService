//
//  SGDataService.m
//  ASIService
//
//  Created by Width on 14-2-28.
//  Copyright (c) 2014年 mojingtao. All rights reserved.
//

#import "SGDataService.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"


@implementation SGDataService

+(ASIHTTPRequest*)requestWithUrl:(NSString *)urlString dictParams:(NSMutableDictionary *)dictparams httpMethod:(NSString *)httpMethod completeBlock:(requestFinishBlock)block
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncodedString]];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setTimeOutSeconds:60];
    [request setRequestMethod:httpMethod];
    NSComparisonResult comparRet = [httpMethod caseInsensitiveCompare:@"POST"];
    if (comparRet == NSOrderedSame) {
        NSArray *allKeys = [dictparams allKeys];
        for (int i = 0 ; i < dictparams.count; i++) {
            NSString *key = allKeys[i];
            id value = dictparams[key];
            [request  addPostValue:value forKey:key];
        }
    }
    //请求完成的block
    [request setCompletionBlock:^{
        NSData *data = [request responseData];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (block == nil) {
            block(result);
        }
    }];
    return nil ;
}

@end
