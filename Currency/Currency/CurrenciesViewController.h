//
//  CurrenciesViewController.h
//  Currency
//
//  Created by Александр Чайковский on 10.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyItem.h"
@interface CurrenciesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
-(void) SetCurrencies:(NSMutableArray *)Sample;
@property (weak, nonatomic) IBOutlet UITableView *MainTable;
@property (nonatomic) NSMutableArray * CurrenciesList;
@property (nonatomic) CurrencyItem * TempCurrencyItem;
@property (nonatomic) NSMutableArray * IDArray;
@property (nonatomic) NSMutableArray * CharCodeArray;
@property (nonatomic) NSMutableArray * CountArray;
@property (nonatomic) NSMutableArray * NameArray;
@property (nonatomic) NSMutableArray * ValueArray;
@property (weak, nonatomic) IBOutlet UIPickerView *SortTypePicker;

@end
