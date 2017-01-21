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
    self.tip_detail.text = [self chooseDescription];
    
}

-(void) viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width,85)];
    [self setNavBar];
}

-(void) setNavBar{
    UIImage *image = [UIImage imageNamed: @"logo_white.png"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    //imageview.frame = CGRectMake(0, -100, self.view.frame.size.width, 40);
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageview;
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
}


-(NSString*) chooseDescription{
    NSArray *array = [NSArray
                      arrayWithObjects:@"Make your recovery a priority – put yourself first and stay in touch with trained professionals who know you and can provide you with comprehensive treatment options and sound advice throughout your recovery",
                      @"Take it one day at a time – recovery is a process, not a destination.  Do not let thoughts of use or old habits get the best of you.  Learn techniques to overcome any negative thoughts and feelings",
                      @"Communicate – addiction can be very isolating so talk to your friends and family about your challenges.  While it may be tough, the support system you create will give you an enormous boost.  They will be there when you need them and will help you stay motivated and focused.",
                      @"Change your environment – one of the best ways to maintain a healthy recovery is to replace your bad habits with healthy, new ones.  Surround yourself with positive people, things and experiences.  Search out cultural events and activities in your area that can stimulate your body and mind in a new, exciting – and healthy way.",
                      @" Change your friends – some of your friends may have been enabling your addiction instead of helping you control it.  If you have friends that may jeopardize your recovery, it is time to find a new circle of friends.  The right friends will help you to maintain a healthy recovery.",
                      @"Get out and exercise – spending 30-60 minutes walking or at the gym will just a few days a week will do wonders for you.  Exercise will not only boost your physical strength, it will boost your mental health as well.",
                      @"Improve your diet – in addition to exercise, eating right is another key ingredient to a successful recovery.  Whether you get help or do it on your own, improvements in diet will make you healthier mentally and physically.",
                      nil];
    NSUInteger rnd = arc4random() % [array count];
    return [array objectAtIndex:rnd];
}

-(void) displayGraph{
    self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,170.0, SCREEN_WIDTH, 150.0)
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
        self.circleChart.countingLabel.format = @"$10 Credited!";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
