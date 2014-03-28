//
//  SecondViewController.m
//  TopTenMaps
//
//  Created by Ileana Padilla on 27/03/14.
//  Copyright (c) 2014 Ileana Padilla. All rights reserved.
//

#import "SecondViewController.h"
#import "AddressBook/AddressBook.h"
#import "ViewController.h"
#import "DetailViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    self.mapView.delegate = self;
    // Do any additional setup after loading the view.
    self.labelPrueba.text = @"Ubicación en mapa";
    NSLog(@"Coordenadas2: %@" ,self.coordenada);
    
    self.coordenadaArray = [self.coordenada componentsSeparatedByString:@","
                            ];
    NSString *jeje = [self.coordenadaArray objectAtIndex:0];
    self.x = [jeje doubleValue];
    
    NSString *jojo = [self.coordenadaArray objectAtIndex:1];
    self.y = [jojo doubleValue];
    NSLog(@"Longitud: %f",self.y);
    
    CLLocationCoordinate2D location1;
    location1.latitude = self.x;
    location1.longitude = self.y;
    
    MKPointAnnotation *point1 =[[MKPointAnnotation alloc] init];
    point1.coordinate = location1;
    point1.title = self.coordenadaName;
    

    
    [self.mapView addAnnotation:point1];

}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CLLocationCoordinate2D location;
    
    location.latitude = self.x;
    location.longitude = self.y;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation

{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    static  NSString *identifier = @"MyAnnotation";
    
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }
    else
    {
        annotationView.annotation = annotation;
    }
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    [rightButton addTarget:self
                action:@selector(buttonizeButtonTap:)
                forControlEvents:UIControlEventTouchUpInside];
    
    annotationView.rightCalloutAccessoryView = rightButton;
    
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

-(void)buttonizeButtonTap:(id)sender{
    [self performSegueWithIdentifier:@"showDetail" sender:sender];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {

    
}
 

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetail"]){
        NSLog(@"Preparandose para segue");
    }
    
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
