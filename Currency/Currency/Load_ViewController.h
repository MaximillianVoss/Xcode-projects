//
//  ViewController.h
//  Currency
//
//  Created by Александр Чайковский on 07.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrenciesViewController.h"
#import "CurrencyItem.h"
@interface ViewController : UIViewController <NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UIButton *NextTestBtn;
- (IBAction)TestBtn_click:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *MainLabel;
- (IBAction)TestBtn_Click:(id)sender;
@property (nonatomic) NSString * ItemValue;
@property (nonatomic) NSString * didStartItem;
@property (nonatomic) NSString * didEndItem;
@property (nonatomic) CurrencyItem * TempCurrencyItem;
@property (nonatomic) NSMutableArray * CurrenciesArray;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ProgressRing;
@property (nonatomic) int RetryCount;
@end
