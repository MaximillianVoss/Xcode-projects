//
//  CustomTableCell.h
//  Currency
//
//  Created by Александр Чайковский on 10.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CustomTableCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *ID;
@property (nonatomic,weak) IBOutlet UILabel *Name;
@property (nonatomic,weak) IBOutlet UILabel *CountTitle;
@property (nonatomic,weak) IBOutlet UILabel *Count;
@property (nonatomic,weak) IBOutlet UILabel *ValueTitle;
@property (nonatomic,weak) IBOutlet UILabel *Value;
@property (nonatomic,weak) IBOutlet UIImageView *CurrencyView;
@property (weak, nonatomic) IBOutlet UILabel *OriginaName;

@end
