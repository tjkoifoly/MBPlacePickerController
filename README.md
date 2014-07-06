MBPlacePicker
======================

A view controller for picking a location. I wrote it to be a simple wrapper around automatic location detection, but also to offer manual location selection in case GPS isn't available.

Screenshots
---
![Jerusalem](screenshots/1b.png)
![Tokyo](screenshots/2b.png)
![Prompt](screenshots/3b.png)
![Automatic](screenshots/4b.png)

Getting Started
---
You'll need to find the `MBPickerController` folder in the repository and add it to your project. CocoaPods support is not available *yet*.

Dependencies
---
`MBPlacePicker` was built in Objective-C with the iOS 7 SDK, ARC, and Core Location. 

**Note:** There's also a copy of another library I'm working on, called `CRLCoreLib`, but that's a standalone and included for your use. Don't worry about that. I'm noting it here because that library may ship seperately in the future. 

Relevant Files
---
Whatever's in the `MBPickerController` folder. It's got a few folders in there, including `CRLCoreLib`, `Place Picker`, `Map View`, and `Resources`. Take all of the folders in there and add them to your project.

Showing a Picker
---
To show a place picker, you need to follow three easy steps:

	// Step 0: Import the header.
	#import "MBPlacePickerController.h"
	
	// Step 1: Create a picker
	MBPlacePickerController *picker = [[]MBPlacePickerController alloc] init];
	
	// Step 2: Display the Picker
	[picker display];
	
That's it!

Getting A Location
---

To get a location when the user picks one, or to get a location when automatic updates come back, assign a delegate to the place picker. You'll need to implement one delegate method to catch those location updates. Assume the picker from "Showing a Picker," your code should look like the following:

	picker.delegate = self;
	
	- (void)placePickerController:(MBPlacePickerController *)placePicker didChangeToPlace:(CLLocation *)place
	{
		//	Do something with the location.
	}

This method will fire whenever the user taps a place, or when Core Location passes a location back to the picker.

Automatic Location Updates
---
To get automatic location updates, call `enableAutomaticUpdates` on your picker. Note that in the event that a user selects a location, `disableAutomaticUpdates` will be called, and you'll have to re-enable automatic updates if you want them. You can call `disableAutomaticUpdates` by yourself if you'd like.

Customizing the Marker Color:
---

To customize the color of the marker that the map uses to show a manually chosen location, set the `markerColor` property of the picker's map view. (The automatic location marker is always purple.)

	picker.map.markerColor = [UIColor orangeColor]; // Sets the marker to Orange.

Customizing the Marker Size:
---
To customize the size of the marker that the map uses to show a manually chosen location, set the `markerDiameter` property.

	picker.map.markerDiameter = 30.0f; // Sets the marker to 30.0f. (30 is default size.)
	
Showing or Hiding User Location:
---
The map view has a toggle for displaying user location (even if the location is manual.) The user's location is indicated by a purple circle.

	picker.map.showUserLocation = YES;	// Enables user location.

License
---
The source code here is released under the MIT License. See [LICENSE](/LICENSE) for details. 

Special Thanks
---
This one goes out to Randall Munroe, because without [XKCD #977](http://xkcd.com/977/), I'd still be searching the internet for the [Plate Carrée map projection](http://en.wikipedia.org/wiki/Equirectangular_projection). (That's the one where pixels equal latitude and longitude points.)

The [map image I used](http://simple.wikipedia.org/wiki/Equirectangular_projection#mediaviewer/File:Equirectangular-projection.jpg) comes from Wikipedia, and according to Wikipedia, is in the public domain.

The image used in the app icon is "[Arrow by Alexander Smith](http://thenounproject.com/term/arrow/49558/) from The Noun Project." (They made me write that, but I'm happy to share good work.)

