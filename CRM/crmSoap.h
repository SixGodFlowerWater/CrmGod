//
//  EcardSoap.h
//  EX_EcardSoap
//
//  Created by learner on 15-6-12.
//  Copyright (c) 2015年 learner. All rights reserved.
//



#import "crmDelegate.h"
#import <Foundation/Foundation.h>


@interface crmSoap : NSObject<NSXMLParserDelegate,NSURLConnectionDelegate>
@property(strong,nonatomic)id<crmDelegate> soapDelgate;
@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSMutableString *soapResults;

@property (strong, nonatomic) NSXMLParser *xmlParser;
@property (nonatomic) BOOL elementFound;
@property (strong, nonatomic) NSString *matchingElement;
@property (strong, nonatomic) NSURLConnection *conn;

-(void)checkAccount:(NSString *)loginCount  Pwd:(NSString *)LooginPwd;//验证用户账号密码



@end
