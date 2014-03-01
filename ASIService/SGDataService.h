//
//  SGDataService.h
//  ASIService
//
//  Created by Width on 14-2-28.
//  Copyright (c) 2014年 mojingtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

typedef void( ^requestFinishBlock )( id result );

@interface SGDataService : NSObject
@property (nonatomic , assign)requestFinishBlock blocks ;
+ (ASIHTTPRequest*)requestWithUrl:(NSString*)urlString dictParams:(NSMutableDictionary*)dictparams httpMethod:(NSString*)httpMethod completeBlock:(requestFinishBlock)block ;

@end
