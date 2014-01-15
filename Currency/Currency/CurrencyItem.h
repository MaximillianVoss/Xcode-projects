//
//  CurrencyItem.h
//  Currency
//
//  Created by Александр Чайковский on 09.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyItem : NSObject
{
    NSString *ID;
    NSString *Charcode;
    NSString *Count;
    NSString *Name;
    NSString *Value;
}
@property(nonatomic) NSString *ID;
@property(nonatomic,retain) NSString *Charcode;
@property(nonatomic) NSString *Count;
@property(nonatomic,retain) NSString *Name;
@property(nonatomic) NSString *Value;

@end
