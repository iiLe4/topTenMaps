//
//  SecondViewController.h
//  TopTenMaps
//
//  Created by Ileana Padilla on 27/03/14.
//  Copyright (c) 2014 Ileana Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface SecondViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelPrueba;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic) NSString *coordenada;
@property(nonatomic) NSString *coordenadaName;
@property(nonatomic) NSArray *coordenadaArray;
@property(nonatomic) double x;
@property(nonatomic) double y;


@end
