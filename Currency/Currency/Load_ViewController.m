//
//  ViewController.m
//  Currency
//
//  Created by Александр Чайковский on 07.12.13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "Load_ViewController.h"
#import "CurrencyItem.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSTimer *timer;
}
@synthesize ItemValue;
@synthesize CurrenciesArray;
@synthesize TempCurrencyItem;
@synthesize RetryCount;

- (void)viewDidLoad
{
    [super viewDidLoad];
    RetryCount = 10;
    //[self StartParcing];
    [self performSelectorInBackground:@selector(StartParcing) withObject:nil];
}

-(void)Parcing
{
    @try
    {
        _MainLabel.text  = @"Loading";
        _ProgressRing.hidden = NO;
        NSURL *url = [[NSURL alloc]initWithString:@"http://www.cbr.ru/scripts/XML_daily.asp?date_req=02/03/2007"];
        NSXMLParser *parser = [[NSXMLParser alloc ]initWithContentsOfURL:url];
        parser.delegate = self;
        CurrenciesArray = [[NSMutableArray alloc] initWithCapacity:0];
        [parser parse];
        [_ProgressRing startAnimating];
    }
    @catch (NSException *exception)
    {
        
    }
}


-(void)ResultCheck
{
    @try
    {
        if (CurrenciesArray.count ==0 && RetryCount>0)
        {
            for (int i=0;i<RetryCount;i++)
            {
                if (CurrenciesArray.count ==0 && RetryCount>0)
                {
                    RetryCount--;
                    [self StartParcing];
                }
                else
                {
                    break;
                }
            }
        }
        else if (CurrenciesArray.count ==0 && RetryCount==0)
        {
            _MainLabel.text =@"Connection error";
            _NextTestBtn.hidden = NO;
            _NextTestBtn.titleLabel.text = @"Try again";
            [_NextTestBtn setTitle:@"Try again" forState:UIControlStateNormal];
            _ProgressRing.hidden = YES;
            [_ProgressRing stopAnimating];
        }
        else if (CurrenciesArray.count !=0)
        {
            [_ProgressRing stopAnimating];
            _MainLabel.text = @"Done";
            _NextTestBtn.hidden = NO;
            _ProgressRing.hidden = YES;
            [_NextTestBtn setTitle:@"Return" forState:UIControlStateNormal];
            [_ProgressRing stopAnimating];
            [timer invalidate];
            [self AutoNavigate];
        }
    }
    @catch (NSException *exception)
    {
        // _MainLabel.text =exception;
    }
}


-(void)StartParcing
{
    [self performSelectorInBackground:@selector(Parcing) withObject:nil];
    @autoreleasepool
    {
        NSRunLoop *TimerRunLoop = [NSRunLoop currentRunLoop];
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ResultCheck) userInfo:nil repeats:YES];
        [TimerRunLoop run];
    }
}

-(void)AutoNavigate
{
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //CurrenciesViewController *Temp = (CurrenciesViewController *)[storyboard instantiateViewControllerWithIdentifier:@"CurrenciesViewController"];
    //[self.navigationController pushViewController:Temp animated:YES];
    [self performSegueWithIdentifier:@"ShowCurrencies"sender:self];
}



-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    ItemValue  = elementName;

    if ([elementName isEqualToString:@"ValCurs"])
    {
        //NSLog(@"found rootelement");
        return;
    }
    else if ([elementName isEqualToString:@"Valute"])
    {
        TempCurrencyItem = [[CurrencyItem alloc] init];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"ValCurs"])
    {
        //NSLog(@"rootelement End");
    }
    else if ([elementName isEqualToString:@"Valute"])
    {
    [CurrenciesArray addObject:TempCurrencyItem];
    }
}

-(BOOL)comparator:(NSString*)Samaple
{
    NSRange range = [Samaple rangeOfString:@"\n"];
    if ([Samaple isEqualToString:@"\n"] || range.location==0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (NO == [self comparator:(string)])
    {
    if ([ItemValue isEqualToString:@"NumCode"])
    {
            TempCurrencyItem.ID = string;
    }
    else if ([ItemValue isEqualToString:@"CharCode"])
    {
            TempCurrencyItem.Charcode = string;
    }
    else if ([ItemValue isEqualToString:@"Nominal"])
    {
            TempCurrencyItem.Count = string;
    }
    else if ([ItemValue isEqualToString:@"Name"])
    {
            TempCurrencyItem.Name = string;
    }
    else if ([ItemValue isEqualToString:@"Value"])
    {
            TempCurrencyItem.Value = string;
    }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)TestBtn_click:(id)sender
{
     [self performSelectorInBackground:@selector(StartParcing) withObject:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCurrencies"])
    {
        CurrenciesViewController *controller = (CurrenciesViewController *)segue.destinationViewController;
        [controller SetCurrencies:CurrenciesArray];
    }
}




@end

