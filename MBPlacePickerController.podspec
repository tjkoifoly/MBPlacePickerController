Pod::Spec.new do |s|

  s.name         = "MBPlacePickerController"
  s.version      = "2.2.1"
  s.summary      = "An open source place picker for iOS."
  s.description  = <<-DESC
	A view controller for picking a location. I wrote it to be a simple wrapper around automatic location detection, but also to offer manual location selection in case GPS isn't available.
                   DESC
  s.homepage     = "https://github.com/MosheBerman/MBPlacePickerController"
  s.screenshots  = "https://raw.github.com/MosheBerman/MBPlacePickerController/master/screens/2.2.0/Readme/Default-Dark.png"
  s.author       = { "Moshe Berman" => "moshberm@gmail.com" }
  s.license 	 = 'MIT'
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/MosheBerman/MBPlacePickerController.git", :tag => "2.2.1"} 
  s.source_files  = 'Classes', 'MBPlacePickerController/MBPlacePickerController/**/*.{h,m}'
  s.frameworks = 'QuartzCore'
  s.requires_arc = true
end
