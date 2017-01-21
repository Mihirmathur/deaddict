//
//  FirstViewController.m
//  deaddict
//
//  Created by Shashank Khanna on 1/21/17.
//  Copyright © 2017 Shashank Khanna. All rights reserved.
//

#import "FirstViewController.h"

//For Circle Chart


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self._current = @4;
    [self displayGraph];
}

-(void) displayGraph{
    self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,150.0, SCREEN_WIDTH, 100.0)
                                                      total:@7
                                                    current:self._current
                                                  clockwise:YES];
    
    
    self.circleChart.backgroundColor = [UIColor clearColor];
    
    [self.circleChart setStrokeColor:[UIColor clearColor]];
    [self.circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    [self.circleChart strokeChart];
    
    [self.view addSubview:self.circleChart];
    self.circleChart.countingLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.circleChart.countingLabel.numberOfLines = 2;
    self.circleChart.countingLabel.format = @"%d \n days";
    [self.circleChart.countingLabel countFrom:0 to:[self.circleChart.current floatValue] withDuration:self.circleChart.duration];

}

- (IBAction)incrementPressed:(UIButton *)sender {
    NSNumber *prev = self._current;
    if ([prev intValue] < [self.circleChart.total intValue]) {
        self._current = [NSNumber numberWithInt:[self._current intValue]+1];
    self.circleChart.current = self._current;
    self.circleChart.gradientMask.strokeColor = [[UIColor clearColor] CGColor];
    [self.circleChart strokeChart];
    self.circleChart.countingLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.circleChart.countingLabel.numberOfLines = 2;
    self.circleChart.countingLabel.format = @"%d \n days";
    [self.circleChart.countingLabel countFrom:[prev floatValue] to:[self.circleChart.current floatValue] withDuration:self.circleChart.duration];
    }
    else{
        self.circleChart.countingLabel.format = @"Complete!";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
