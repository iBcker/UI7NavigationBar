//
//  MainViewController.m
//  UI7NavigationBar
//
//  Created by iBcker on 13-9-27.
//  Copyright (c) 2013年 iBcker. All rights reserved.
//

#import "MainViewController.h"
#import "UINavigationBar+UI7.h"
#import "OtherViewController.h"


@interface MainViewController ()
@property (nonatomic,strong)UILabel *lbAlpha;
@property (nonatomic,strong)UILabel *lbColor;
@end

@implementation MainViewController

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
    [super viewDidLoad];
    
    self.title=@"first";
    
    UILabel *lb=[[UILabel alloc] initWithFrame:CGRectMake(10, 120, 50, 20)];
    [self.view addSubview:lb];
    [lb setBackgroundColor:[UIColor clearColor]];

    lb.text=@"alpha:";
    UISlider *slalpha=[[UISlider alloc] initWithFrame:CGRectMake(60, 120, 220, 20)];
    [self.view addSubview:slalpha];
    [slalpha setValue:0.66];
    [slalpha addTarget:self action:@selector(onUpdateAlphaVaule:) forControlEvents:UIControlEventValueChanged];
    
    NSArray *segmentedArray = [[NSArray alloc] initWithObjects:@"black",@"Red",@"yellow",@"blue",nil];
    
    UISegmentedControl *colorSelecter=[[UISegmentedControl alloc] initWithItems:segmentedArray];
    
    [colorSelecter setSelectedSegmentIndex:0];
    [colorSelecter addTarget:self action:@selector(onChangeColor:) forControlEvents:UIControlEventValueChanged];
    
    colorSelecter.frame=CGRectMake(40, 50, 220, 40);
    
    [self.view addSubview:colorSelecter];
    
    
    UIButton *bn=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    [self.view addSubview:bn];
    [bn setTitle:@"push" forState:UIControlStateNormal];
    [bn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bn addTarget:self action:@selector(onBn:) forControlEvents:UIControlEventTouchUpInside];
	// Do any additional setup after loading the view.
}

- (IBAction)onBn:(id)sender
{
    OtherViewController *other=[[OtherViewController alloc] init];
    [self.navigationController pushViewController:other animated:YES];
}


- (void)onChangeColor:(UISegmentedControl *)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [self.navigationController.navigationBar setConstomBackgroundColor:[UIColor blackColor]];
            break;
        case 1:
            [self.navigationController.navigationBar setConstomBackgroundColor:[UIColor redColor]];
            break;
        case 2:
            [self.navigationController.navigationBar setConstomBackgroundColor:[UIColor yellowColor]];
            break;
        case 3:
            [self.navigationController.navigationBar setConstomBackgroundColor:[UIColor blueColor]];
            break;
        default:
            break;
    }
}



- (void)onUpdateAlphaVaule:(UISlider *)sender
{
    [self.navigationController.navigationBar setConstomBackgroundAlpha:sender.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
