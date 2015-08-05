//
//  DetailTitleTableViewController.h
//  CRM
//
//  Created by Mac on 15/8/4.
//  Copyright (c) 2015年 crmTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "crmDelegate.h"

@interface DetailTitleTableViewController : UITableViewController<crmDelegate>
@property(strong,nonatomic)NSString *getWhat;
@end
