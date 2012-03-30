#import "DDSpeakersTableViewController.h"
#import "DDSpeakerViewController.h"

@interface DDSpeakersTableViewController ()
@property(nonatomic, retain) NSArray *speakers;
@end

@implementation DDSpeakersTableViewController
@synthesize speakers = _speakers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set up the datasource for our table, normally this would be something dynamic
    // conecting to a server or using a persistent store of some type on the device
    self.speakers = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Drew Dahlman", @"name",
                      @"Drew divides his time between designing and developing. He is a jack of all trades and as you can see bears an uncanny likeness to a famous actor… Rodney Dangerfield.", @"description", 
                      @"Develop Denver", @"organization", 
                      @"drew-thumb.png", @"thumb", 
                      @"drew.jpg", @"image", nil],
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Pete Larson", @"name",
                      @"\"When he is not making and eating peanutbutter sandwiches, Pete Larson divides his time between drinking heavliy (pictured) and occasionally coding.\" -Eric Wedum", @"description", 
                      @"Jiffy Media", @"organization",
                      @"pete-thumb.png", @"thumb", 
                      @"pete.jpg", @"image", nil],
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Sean Dougherty", @"name",
                      @"As a former art major, Sean Doughery understands the importance of visual impact. Check out the guns ladies, LOOK but don't touch, he is spoken for (sorry).", @"description", 
                      @"process255", @"organization",
                      @"sean-thumb.png", @"thumb", 
                      @"sean.jpg", @"image", nil],
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Sean & Matt", @"name",
                      @"These dudes work it with their legs.", @"description",
                      @"Legwork", @"organization",
                      @"sean-matt-thumb.png", @"thumb", 
                      @"sean-matt.jpg", @"image", nil],
                     nil];
}

#pragma mark - Table view data source

// return the number of sections our table should contain
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

// return the number of rows our table should contain
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    
    // return the number of speakers
    return [self.speakers count];
}

// return the height of table cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 93;
}

// called when a new table cell is created
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SpeakerCell";
    
    // grab a queued cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // create a new cell if one is not in the queue
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
    }
    
    // grab the speaker dictionary
    NSDictionary *speaker = [self.speakers objectAtIndex:indexPath.row];
    
    // grab a reference to the thumbnail image view in the cell
    UIImageView *thumb = (UIImageView *)[cell viewWithTag:1];
    
    // set the thumbnail imageview's image in cell's image
    thumb.image = [UIImage imageNamed:[speaker objectForKey:@"thumb"]];
    
    // grab a reference to the name label in the cell
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    
    // set the name in the cell's name label
    nameLabel.text = [speaker objectForKey:@"name"];
    
    return cell;
}

// Do some customisation of our new view when a table item has been selected
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Make sure we're referring to the correct segue
    if ([[segue identifier] isEqualToString:@"ShowSpeaker"]) {
        
        // Get reference to the destination view controller
        DDSpeakerViewController *vc = [segue destinationViewController];
        
        // get the selected index
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        
        // grab the speaker dictionary
        NSDictionary *speaker = [self.speakers objectAtIndex:selectedIndex];
        
        // Pass the name to our view controller
        vc.name = [speaker objectForKey:@"name"];
        
        // Pass the description to our view controller
        vc.description = [speaker objectForKey:@"description"];
        
        // Pass the imagePath to our view controller
        vc.imagePath = [speaker objectForKey:@"image"];
        
        // Pass the organizagtion to our view controller
        vc.organization = [speaker objectForKey:@"organization"];
    }
}

@end
