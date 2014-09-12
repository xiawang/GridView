//
//  XWViewController.m
//  GridView
//
//  Created by 王小天 on 14-9-11.
//  Copyright (c) 2014年 Xiaotian Wang. All rights reserved.
//

#import "XWViewController.h"

int initialGrid[9][9] = {
  {1,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {2,0,0,0,0,0,0,0,2},
};

@interface XWViewController () {
  UIView* _gridView;
  
}

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
  CGFloat margin = (size - 9*buttonSize) / 10.0;
  
  
  
  for (int i = 0; i < 81; i++) {
    // row and col
    int col = i % 9;
    int row = i / 9;
    
    // relative pos
    CGFloat a = x + margin + col * (buttonSize + margin);
    CGFloat b = y + margin + row * (buttonSize + margin);
    
    // add button
    UIButton *one = [[UIButton alloc] init];
    one.frame = CGRectMake(a, b, buttonSize, buttonSize);
    one.backgroundColor = [UIColor whiteColor];
    one.tag = i;
    
    // set the label of the button
    NSString *buttonNumber = [NSString stringWithFormat:@"%d", initialGrid[row][col]];
    [one setTitle:buttonNumber forState:UIControlStateNormal];
    [one setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:one];
    
    
    
    // [self addButton:buttonSize x:a y:b btag:i];
    
    // create target for button
    
    [one addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
  NSLog(@"You pressed the button with tage %d", button.tag);
}

@end
