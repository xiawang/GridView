//
//  XWViewController.m
//  GridView
//
//  Created by 王小天 on 14-9-11.
//  Copyright (c) 2014年 Xiaotian Wang. All rights reserved.
//

#import "XWViewController.h"

int initialGrid[9][9] = {
  {7,0,0,4,2,0,0,0,9},
  {0,0,9,5,0,0,0,0,4},
  {0,2,0,6,9,0,5,0,0},
  {6,5,0,0,0,0,4,3,0},
  {0,8,0,0,0,6,0,0,7},
  {0,1,0,0,4,5,6,0,0},
  {0,0,0,8,6,0,0,0,2},
  {3,4,0,9,0,0,1,0,0},
  {8,0,0,3,0,2,7,4,0},
};

@interface XWViewController () {
  UIView* _gridView;
  
}

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@implementation XWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
  self.view.backgroundColor = [UIColor whiteColor];
  
  // create grid frame
  CGRect frame = self.view.frame;
  CGFloat x = CGRectGetWidth(frame)*0.1;
  CGFloat y = CGRectGetHeight(frame)*0.1;
  CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*0.80;
  
  CGRect gridFrame = CGRectMake(x, y, size, size);
  
  // create grid view
  _gridView = [[UIView alloc] initWithFrame:gridFrame];
  _gridView.backgroundColor = [UIColor blackColor];
  [self.view addSubview:_gridView];
  
  // create button
  CGFloat buttonSize = size / 12.0;
  CGFloat margin = size * 0.01;
  CGFloat largeMargin = size * 0.04825;
  
  // relative pos
  CGFloat a = 0.0;
  CGFloat b = 0.0;
  
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      // row and col
      int col = j;
      int row = i;
      
      // initialize the first margin
      if (col == 0) {
        a = x + largeMargin;
      }
      if (row == 0) {
        b = y + largeMargin;
      }
      
      // add button
      UIButton *one = [[UIButton alloc] init];
      one.frame = CGRectMake(a, b, buttonSize, buttonSize);
      one.backgroundColor = [UIColor whiteColor];
      one.tag = i*9 + j;
      
      // update a
      if ((col+1) %3 != 0) {
        a += (buttonSize + margin);
      } else {
        a += (buttonSize + largeMargin);
      }
      
      // set the label of the button
      NSString *buttonNumber = [NSString stringWithFormat:@"%d", initialGrid[row][col]];
      if (initialGrid[row][col] == 0) {
        buttonNumber = @"";
      }
      [one setTitle:buttonNumber forState:UIControlStateNormal];
      [one setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [one setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
      
      // method to set highlighted background color
      UIColor *myColor = [UIColor yellowColor];
      
      CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
      UIGraphicsBeginImageContext(rect.size);
      CGContextRef context = UIGraphicsGetCurrentContext();
      
      CGContextSetFillColorWithColor(context, [myColor CGColor]);
      CGContextFillRect(context, rect);
      
      UIImage *backImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      
      [one setBackgroundImage:backImage forState:UIControlStateHighlighted];
      
      [self.view addSubview:one];
      
      // create target for button
      
      [one addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // update b
    if (i % 3 == 2) {
      b += (buttonSize + largeMargin);
    } else {
      b += (buttonSize + margin);
    }
    
  }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)addButton:(CGFloat)size x:(CGFloat)x y:(CGFloat)y btag:(int)tag
//{
//  UIButton *one = [[UIButton alloc] init];
//  one.frame = CGRectMake(x, y, size, size);
//  one.backgroundColor = [UIColor whiteColor];
//  one.tag = tag;
//  [self.view addSubview:one];
//}

- (void)buttonPressed:(id)sender
{
  UIButton *button = (UIButton *)sender;
  NSLog(@"You pressed the button with tag %d", button.tag);
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
  CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
