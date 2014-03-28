//
//  ViewController.m
//  TopTenMaps
//
//  Created by Ileana Padilla on 26/03/14.
//  Copyright (c) 2014 Ileana Padilla. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.placesArray = [[NSArray alloc]initWithObjects:@"Hotel RIU", @"Puente Matute Remos",@"Basílica de Zapopan",@"Catedral de Guadalajara", @"Plaza Andares", @"UAG",@"Zoológico de Guadalajara",@"Estadio Omnilife",@"Bosque Colomos",@"Parque Metropolitano", nil];
    self.coordenadasArray = @[@"20.665837, -103.393731",
                         @"20.664850, -103.393754",
                         @"20.721241, -103.392143",
                         @"20.677016, -103.346998",
                         @"20.710033, -103.412150",
                         @"20.696756, -103.417898",
                         @"20.724018, -103.308513",
                         @"20.681619, -103.462704",
                         @"20.708277, -103.394710",
                         @"20.671273, -103.440632"];
    self.imagesArray = [[NSArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"Cell";
    Cell *cell = (Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
    }
    cell.labelPoint.text = self.placesArray[[indexPath row]];
    cell.imageView.image = [UIImage imageNamed:self.imagesArray[[indexPath row]]];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.placesArray.count;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showMap"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        SecondViewController *controller = (SecondViewController *)segue.destinationViewController;
        controller.coordenada = self.coordenadasArray[[indexPath row]];
        controller.coordenadaName = self.placesArray[[indexPath row]];
    }
    
}

@end
