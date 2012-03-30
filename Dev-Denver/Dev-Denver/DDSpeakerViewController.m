#import "DDSpeakerViewController.h"

// private properties
@interface DDSpeakerViewController ()
@property(nonatomic, retain) IBOutlet UILabel *organizationLabel;
@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) IBOutlet UITextView *descriptionTextView;
@end

@implementation DDSpeakerViewController

@synthesize organizationLabel   = _organizationLabel;
@synthesize name                = _name;
@synthesize organization        = _organization;
@synthesize imagePath           = _imagePath;
@synthesize description         = _description;
@synthesize imageView           = _imageView;
@synthesize descriptionTextView = _descriptionTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the name
    self.organizationLabel.text = self.organization; 
    
    // set the nav bar title
    self.title = self.name;
    
    // set the image
    self.imageView.image = [UIImage imageNamed:self.imagePath]; 
    
    // set the description
    self.descriptionTextView.text = self.description; 
}


@end
