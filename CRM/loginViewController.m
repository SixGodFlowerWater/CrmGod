//
//  loginViewController.m
//  CRM
//
//  Created by Mac on 15/8/3.
//  Copyright (c) 2015年 crmTeam. All rights reserved.
//

#import "loginViewController.h"
#import "softUser.h"

@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userIdText;
@property (weak, nonatomic) IBOutlet UITextField *userPwdText;
@property(strong,nonatomic)crmSoap *soap;
@property(strong,nonatomic)UIAlertView *myalrtview;

@end

@implementation loginViewController
#pragma _mark BtnEventMothd
- (IBAction)loginIn:(id)sender {//登录
    _soap=[[crmSoap alloc]init];
    _soap.soapDelgate=self;
    [_soap checkAccount:self.userIdText.text Pwd:self.userPwdText.text];
    _myalrtview=[[UIAlertView alloc]initWithTitle:nil message:@"正在登陆》》》" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [_myalrtview show];
}
#pragma -mark crmdelegate
-(void)doWhenEcardGetInfoFromWebServier:(NSString *)soapresult{
    if ([soapresult isEqualToString:@"成功"]) {
        [self performSegueWithIdentifier:@"signIn" sender:self];
        [self.myalrtview dismissWithClickedButtonIndex:0 animated:YES];
        [self.soap getUserInfoByUserIdAndUserPWd:self.userIdText.text Pwd:self.userPwdText.text];
    }
    else{
        if ([soapresult isEqualToString:@"失败"]) {
            UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:@"登陆失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertview show];

        }
        else{
            NSLog(@"soapresult %@",soapresult);
            NSData *data=[soapresult dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error=nil;
            NSMutableDictionary *userDic=(NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            
            NSLog(@"userdic%@",[userDic description]);
            if (!error) {
                softUser *Localuser=[softUser sharedLocaluserUserByDictionary:userDic];
            }
        }
        
    }
    
}
-(void)doWhenHttpCollecttionFalil:(NSError *)error{
    UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:@"登陆失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertview show];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userPwdText resignFirstResponder];
    [self.userIdText resignFirstResponder];
}


@end
