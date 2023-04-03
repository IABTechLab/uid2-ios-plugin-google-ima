Pod::Spec.new do |s|
    s.name             = 'UID2-IMA-Plugin'
    s.version          = '0.1.0'
    s.summary          = 'Secure Signals Adapter for integrating with UID2 SDK'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = <<-DESC
    Secure Signals Adapter for integrating with UID2 SDK    
                         DESC
  
    s.homepage         = 'https://github.com/IABTechLab/uid2docs'
    s.license          = { :type => 'Apache License, Version 2.0', :url => 'https://github.com/IABTechLab/uid2-ios-plugin-google-ima/blob/main/LICENSE.md' }
    s.author           = { 'Brad Leege' => 'brad.leege@thetradedesk.com' }
    s.source           = { :git => 'https://github.com/IABTechLab/uid2-ios-plugin-google-ima', :tag => s.version.to_s }
  
    s.ios.deployment_target = '13.0'
  
    s.source_files = 'Sources/UID2IMAPlugin/**/*'
      
    s.dependency 'GoogleAds-IMA-iOS-SDK', '~> 3.18.4'
  end
  