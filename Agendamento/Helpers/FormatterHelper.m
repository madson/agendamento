//
//  FormatterHelper.m
//  LoansApp
//
//  Created by Madson on 4/14/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "FormatterHelper.h"

@implementation FormatterHelper

+ (NSNumberFormatter *)currencyFormatter {
    static NSNumberFormatter *numberFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        numberFormatter = NSNumberFormatter.new;
        numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    });
    
    return numberFormatter;
}

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = NSDateFormatter.new;
        dateFormatter.dateFormat = @"dd/MM/yyyy";
    });
    
    return dateFormatter;
}


@end
