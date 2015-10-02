
Pod::Spec.new do |s|
  s.name             = "IPLImageKit"
  s.version          = "1.0.0"
  s.summary          = "A short description of CYKImageKit."
  s.description      = <<-DESC
                       An optional longer description of pod SAKWallet

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/zyk1121/IPLImageKit"
  s.license          = { :type => 'All rights reserved' }
  s.author           = { "Yuanke Zhang" => "542944896@qq.com" }
  s.source           = { :git => "https://github.com/zyk1121/IPLImageKit.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = "Classes/**/*.{h,m}"
  s.resource_bundles = {
    'IPLImageKit' => ['Classes/Resources/*.png']
  }
  s.library = 'stdc++'
  s.frameworks = 'Foundation','UIKit'

  s.dependency 'libextobjc', '~> 0.4'
  s.dependency 'ReactiveCocoa', '~> 2.5.0'
  s.dependency 'Masonry', '~> 0.6.0'
end
