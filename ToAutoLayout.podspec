Pod::Spec.new do |s|
  s.name         = "ToAutoLayout"
  s.version      = "0.0.2"
  s.summary      = "The most easy way to create simple autolayouts."
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.description  = <<-DESC
			ToAutoLayout is a tool for add auto layout
			easily programatically.
                  DESC

  s.homepage         = "https://github.com/torcelly/ToAutolayout"
  # s.screenshots    = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.author           = { "Fernando Torcelly" => "fernando@torcelly.com" }
  s.social_media_url = "http://twitter.com/torcelly"
  s.source           = { :git => "https://github.com/torcelly/ToAutolayout.git", :tag => "#{s.version}" }

  s.requires_arc     = true

  s.source_files     = 'Source/*.swift'
  
  # iOS specific
  s.ios.deployment_target = '8.0'
  s.ios.frameworks   = 'UIKit'
  
  # macOS specific
  s.osx.deployment_target = '10.12'
  s.osx.frameworks = 'Cocoa'

end
