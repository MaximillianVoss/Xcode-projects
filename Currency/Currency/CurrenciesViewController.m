//
//  CurrenciesViewController.m
//  Currency
//
//  Created by Александр Чайковский on 10.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "CurrenciesViewController.h"
#import "CustomTableCell.h"
@interface CurrenciesViewController ()


@end

@implementation CurrenciesViewController
{
    NSArray *tableData;
}

@synthesize CurrenciesList;
@synthesize IDArray;
@synthesize CharCodeArray;
@synthesize CountArray;
@synthesize NameArray;
@synthesize ValueArray;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_MainTable setDataSource:self];
    [_MainTable setDelegate:self];
}




-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CurrenciesList count];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [CurrenciesList count];
}

-(void) SetCurrencies:(NSMutableArray *)Sample
{
    CurrenciesList = Sample;
    IDArray = [[NSMutableArray alloc] initWithCapacity:0];
    CharCodeArray =[[NSMutableArray alloc] initWithCapacity:0];
    CountArray = [[NSMutableArray alloc] initWithCapacity:0];
    NameArray = [[NSMutableArray alloc] initWithCapacity:0];
    ValueArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0;i<CurrenciesList.count;i++)
    {
        CurrencyItem *TempObject = CurrenciesList[i];
        [IDArray addObject:TempObject.ID];
        [CharCodeArray addObject:TempObject.Charcode];
        [CountArray addObject:TempObject.Count];
        [NameArray addObject:TempObject.Name];
        [ValueArray addObject:TempObject.Value];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *Identifier = @"CustomTableCell";
    CustomTableCell *cell =(CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil )
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner: self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.ID.text =[IDArray objectAtIndex:indexPath.row];
    cell.OriginaName.text = [NameArray objectAtIndex:indexPath.row];
    cell.Count.text = [CountArray objectAtIndex:indexPath.row];
    cell.Name.text = [CharCodeArray objectAtIndex:indexPath.row];
    cell.Value.text =[ValueArray objectAtIndex:indexPath.row];
    cell.CurrencyView.image = [UIImage imageNamed:@"Coin.png"];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView  heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        return 140;
    }

@end
