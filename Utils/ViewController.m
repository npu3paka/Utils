//
//  ViewController.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "RegularExpression.h"
#import "NSString+StringUtils.h"
#import "NSDate+Utils.h"
#import "NSArray-Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIView *view = [[UIView alloc]init];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self testNSPredicate];
    
    //[self testRegularExpressions];
    
    //[self testNSStrings];
    
    //[self testNSDate];
    
    [self testNSArray];
}

- (void) testNSArray {
    NSArray *arr = [NSArray intArrayFrom:10 to:5];
    NSArray *arr2 = [NSArray intArrayFrom:5 to:10];
    NSArray *arr1 = [NSArray generateArrayWithFirstNumber:5 andRange:10];
    
    NSLog(@"arr With Ned+: %@",arr);
    NSLog(@"arr With Ned: %@",arr2);
    NSLog(@"arr Range: %@",arr1);
    NSString *strin = [@"test asd asd" escapeAll];
    NSMutableArray *ar3 = [[NSMutableArray alloc] init];
    
    ar3 = [arr objectAtIndex:31];
    ar3 = [arr objectAtIndex:3 withDefault:arr2];
}

- (void) testNSDate {
    NSDate *date = [NSDate date];
    NSLog(@"Beginning of Day:%@", [date beginningOfDay]);
    
    NSLog(@"weekday: %lu", (unsigned long)[date weekday] );
    NSLog(@"number Of Days in Month %lu", (unsigned long)[date numberOfDaysInMonth] );
    
    
    NSLog(@"Current Time: %@", date);
    NSLog(@"Beginning of Day:%@", [date beginningOfDay]);
    NSLog(@"End of Day:%@", [date endOfDay]);
    NSLog(@"Beginning of Week:%@", [date beginningOfWeek]);
    NSLog(@"End of Week:%@", [date endOfWeek]);
    NSLog(@"Beginning of Month:%@", [date beginningOfMonth]);
    NSLog(@"End of Month:%@", [date endOfMonth]);
    NSLog(@"Beginning of Year:%@", [date beginningOfYear]);
    NSLog(@"End of Year:%@", [date endOfYear]);
}

- (void) testNSPredicate {
    
    NSArray *firstNames = @[ @"Alice", @"Bob", @"Charlie", @"Quentin" ];
    NSArray *lastNames = @[ @"Smith", @"Jones", @"Smith", @"Alberts" ];
    NSArray *ages = @[ @24, @27, @33, @31 ];
    
    NSMutableArray *people = [[NSMutableArray alloc]init];
    
    for (int i=0; i< firstNames.count; i++) {
        Person *person = [[Person alloc] init];
        person.firstName = firstNames[i];
        person.lastName = lastNames[i];
        person.age = ages[i];
        [people addObject:person];
        
    }
    NSPredicate *bobPredicate = [NSPredicate predicateWithFormat:@"firstName = 'Bob' OR firstName = 'Quentin'"];
    NSPredicate *smithPredicate = [NSPredicate predicateWithFormat:@"lastName = %@", @"Smith"];
    NSPredicate *thirtiesPredicate = [NSPredicate predicateWithFormat:@"age >= 30"];
    
    // ["Bob Jones"]
    NSLog(@"Bobs: %@", [people filteredArrayUsingPredicate:bobPredicate]);
    
    // ["Alice Smith", "Charlie Smith"]
    NSLog(@"Smiths: %@", [people filteredArrayUsingPredicate:smithPredicate]);
    
    // ["Charlie Smith", "Quentin Alberts"]
    NSLog(@"30's: %@", [people filteredArrayUsingPredicate:thirtiesPredicate]);
    
    NSPredicate *ageIs33Predicate = [NSPredicate predicateWithFormat:@"%K = %@", @"age", @33];
    
    // ["Charlie Smith"]
    NSLog(@"Age 33: %@", [people filteredArrayUsingPredicate:ageIs33Predicate]);
    
    NSPredicate *namesBeginningWithLetterPredicate = [NSPredicate predicateWithFormat:@"(firstName BEGINSWITH[cd] $letter) OR (lastName BEGINSWITH[cd] $letter)"];
    
    // ["Alice Smith", "Quentin Alberts"]
    NSLog(@"'A' Names: %@", [people filteredArrayUsingPredicate:[namesBeginningWithLetterPredicate predicateWithSubstitutionVariables:@{@"letter": @"A"}]]);
    
    NSPredicate *betweenPredicate =
    [NSPredicate predicateWithFormat: @"attributeName BETWEEN %@", @[@1, @10]];
    
    NSDictionary *dictionary = @{ @"attributeName" : @12 };
    
    BOOL between = [betweenPredicate evaluateWithObject:dictionary];
    if (between) {
        NSLog(@"between");
    } else {
        NSLog(@"not between");
    }
}

- (void) testRegularExpressions {
    NSLog(@"is 100 number: %hhd", [RegularExpression isNumber:@"100"]);
    NSLog(@"is altimir14@abv.bg validEmail: %hhd", [RegularExpression isValidateEmail:@"altimir14@abv.bg"]);
    NSLog(@"is a@abv.bg validEmail: %hhd", [RegularExpression isValidateEmail:@"a@abv.bg"]);
    NSLog(@"is altimir14@a.b validEmail: %hhd", [RegularExpression isValidateEmail:@"altimir14@a.b"]);
    NSLog(@"is 'abv' englishword: %hhd", [RegularExpression isEnglishWords:@"abv"]);
    NSLog(@"is 'абв' englishword: %hhd", [RegularExpression isEnglishWords:@"абв"]);
    NSLog(@"is 'абв' chineseword: %hhd", [RegularExpression isChineseWords:@"абв"]);
}

- (void) testNSStrings {
    NSString *sentence = @"Altimir is iOS developer.";
    
    NSLog(@"words count: %d", [sentence wordsCount]);
    NSLog(@"byte Length: %d", [sentence byteLengthWithEncoding:NSStringEncodingConversionExternalRepresentation]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
