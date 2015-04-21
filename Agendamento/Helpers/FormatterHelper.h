//
//  FormatterHelper.h
//  LoansApp
//
//  Created by Madson on 4/14/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The FormatterHelper is intended to group the singleton instances of formatters like NSNumberFormatter and NSDateFormatter.
 */
@interface FormatterHelper : NSObject

/**
 Returns an singleton instance of NSNumberFormatter style currency.
 */
+ (NSNumberFormatter *)currencyFormatter;

/**
 Returns an singleton instance of NSDateFormatter.
 */
+ (NSDateFormatter *)dateFormatter;

@end
