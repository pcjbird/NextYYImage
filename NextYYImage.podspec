Pod::Spec.new do |s|
  s.name         = 'NextYYImage'
  s.summary      = 'Image framework for iOS to display/encode/decode animated WebP, APNG, GIF, and more. YYImage based, but support Apple Silicon arm64 simulator.
'
  s.version      = '1.0.9'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = {"pcjbird" => "pcjbird@hotmail.com"}
  s.source           = {:git => "https://github.com/pcjbird/NextYYImage.git", :tag => s.version.to_s}
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/pcjbird/NextYYImage'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  
  s.requires_arc = true
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'YYImage/*.{h,m}'
    core.public_header_files = 'YYImage/*.{h}'
    core.libraries = 'z'
    core.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore', 'AssetsLibrary', 'ImageIO', 'Accelerate', 'MobileCoreServices'
  end
  
  s.subspec 'WebP' do |webp|
    webp.dependency 'NextYYImage/Core'
    webp.ios.vendored_frameworks = 'WebP/WebP.xcframework'
  end

  s.subspec 'libwebp' do |libwebp|
    libwebp.dependency 'NextYYImage/Core'
    libwebp.dependency 'libwebp'
    libwebp.xcconfig = { 
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
  end
  
end
