## Build tools & versions used
- Swift, XCode 13.4, Reworked a SwiftUI template to launch via Scene/App Delegate.
- Revealapp.com for assistance setting up layout

## Steps to run the app
1.  Open Xcode Project file and let swift package manager pull related dependencies.
2.  Build the 'Directory' scheme to your iOS simulator.
3.  3rd Party libraries used
	- [Codeextended](https://github.com/JohnSundell/Codextended)
		- even greater simplification of Codable 
	- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
		- image cacheing

## What areas of the app did you focus on?
- clean code, easy to follow structure, with focus on future improvements and testability.

## What was the reason for your focus? What problems were you trying to solve?
- I was stuck for a bit on how to get the table header to properly size itself.  I also debated attempting to mix a SwiftUI View for the table view cell.  I decided the way to do that was just going to add unnecessary mix of code for the task at hand.

## How long did you spend on this project?
* 8-10 hours over the course of about 4 days.

## Did you make any trade-offs for this project? What would you have done differently with more time?
- I built this using UITableView, but would have spent more time implementing this in a CollectionView as i feel it can provide greater flexibility as your feature sets enhance.  For the sake of simplicity i made the trade off to create a UITableView instead.

## What do you think is the weakest part of your project?
- Currently this has a lack of a network mocking service to validate the Directory Service and write some unit tests.

- I am also not happy with the solution for the error state in which i used the table header.

- A Collection View could have been used for greater control and flexibility down the road.

- Colors should have be configured in an asset catalog to better accommodate dark mode, as i noticed issues with the large title navigation, even if i attempted to override the user interface style.

## Did you copy any code or dependencies? Please make sure to attribute them here!
As a personal challenge, i tried to just put this together without any.  That said, a couple caveats.

- I did pull in a few extensions from code i've written in the past to simplify things.

- I looked up a few solutions on loading json files, just to guide me and remember how to do that.  Mostly from [this site](https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift).

## Is there any other information you’d like us to know?
- Unit tests are placed next to their respective owner/class within the project hierarchy.

- This was an incredibly fun task to put together.  I appreciate the level of detail you describe the issue as well as answer frequently asked questions within that.  The structure made it easy to see the result, and plan ahead within the time i had to get it done.
