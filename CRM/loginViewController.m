//
//  loginViewController.m
//  CRM
//
//  Created by Mac on 15/8/3.
//  Copyright (c) 2015年 crmTeam. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userIdText;
@property (weak, nonatomic) IBOutlet UITextField *userPwdText;
@property(strong,nonatomic)crmSoap *soap;
@property(strong,nonatomic)UIAlertView *myalrtview;
@end

@implementation loginViewController
- (IBAction)loginIn:(id)sender {
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
    }
    else{
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:@"登陆失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertview show];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userPwdText resignFirstResponder];
    [self.userIdText resignFirstResponder];
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
