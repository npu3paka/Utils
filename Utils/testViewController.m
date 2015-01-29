//
//  testViewController.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "testViewController.h"
#import "UIView+ViewUtils.h"
#import "RegularExpression.h"


@implementation testViewClass
- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}
@end

@interface testViewController ()

@end

@implementation testViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIView *testView = [[UIView alloc] init];
    UIView *viewTag = [testView viewWithTag:1];
    UIView *viewTagAndClass = [testView viewWithTag:1 ofClass:[testViewClass class]];
    UIView *viewOfClass = [testView viewOfClass:[testViewClass class]];
    
    NSArray *arrayOfViews = [testView viewsWithTag:1];
    
    
    //test frame
    CGPoint origin = testView.origin;
    CGSize size = testView.size;

    NSLog(@"x: %f"
          @"y: %f"
          @"width: %f"
          @"height: %f"
          @"left: %f"
          @"right: %f"
          @"top: %f"
          @"bottom: %f",
          testView.x,testView.y,testView.width,testView.height, testView.left,testView.right,testView.top,testView.bottom);
    
    
    //test bounces
    CGSize bounceSize = testView.boundsSize;
    
    NSLog(@"width: %f"
          @"height: %f",
          testView.width, testView.height);
    
    CGRect contentBounds = testView.contentBounds;
    CGPoint contentSize = testView.contentCenter;
    
    //test frame
    [testView setLeft:5];
    [testView setRight:10];
    [testView setTop:20];
    [testView setBottom:10];
    
    
    [testView setLeft:20 right:20];
    [testView setWidth:200 right:20];
    [testView setTop:20 bottom:20];
    [testView setHeight:200 bottom:20];
    
    [super viewDidLoad];
    
    
    NSLog(@"is 100 number: %hhd", [RegularExpression isNumber:@"100"]);
    NSLog(@"is altimir14@abv.bg validEmail: %hhd", [RegularExpression isValidateEmail:@"altimir14@abv.bg"]);
    NSLog(@"is a@abv.bg validEmail: %hhd", [RegularExpression isValidateEmail:@"a@abv.bg"]);
    NSLog(@"is altimir14@a.b validEmail: %hhd", [RegularExpression isValidateEmail:@"altimir14@a.b"]);
    NSLog(@"is 'abv' englishword: %hhd", [RegularExpression isEnglishWords:@"abv"]);
    NSLog(@"is 'абв' englishword: %hhd", [RegularExpression isEnglishWords:@"абв"]);
    NSLog(@"is 'абв' chineseword: %hhd", [RegularExpression isChineseWords:@"абв"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
