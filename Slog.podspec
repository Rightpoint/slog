Pod::Spec.new do |s|
  s.name             = 'Slog'
  s.version          = '0.1.0'
  s.summary          = 'Simple Swift logging'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple swift logging
                       DESC

  s.homepage         = 'https://github.com/Raizlabs/Slog'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johnstricker' => 'john.stricker@raizlabs.com' }
  s.source           = { :git => 'https://github.com/Raizlabs/Slog.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Slog/Classes/**/*'
end
