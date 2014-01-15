//
//  CustomTableCell.m
//  Currency
//
//  Created by Александр Чайковский on 10.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

@synthesize ID = _ID;
@synthesize OriginaName = _OriginaName;
@synthesize Name = _Name;
@synthesize CountTitle = _CountTitle;
@synthesize Count = _Count;
@synthesize ValueTitle = _ValueTitle;
@synthesize Value = _Value;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
