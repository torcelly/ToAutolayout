Pod::Spec.new do |s|
  s.name         = "ToAutoLayout"
  s.version      = "0.0.1"
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

  s.platform         = :ios
  s.requires_arc     = true

  s.source_files     = 'Source/*.swift'
  s.frameworks       = 'UIKit'

  s.ios.deployment_target = '8.0'

end
