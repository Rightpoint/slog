Pod::Spec.new do |s|
  s.name             = 'Slog'
  s.version          = '0.1.0'
  s.summary          = 'Simple Swift logging'
  s.description      = <<-DESC
    Simple swift logging
                       DESC
  s.homepage         = 'https://github.com/Raizlabs/Slog'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johnstricker' => 'john.stricker@raizlabs.com' }
  s.source           = { :git => 'https://github.com/Raizlabs/Slog.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Slog/Classes/**/*'

  s.subspec 'LogOnly' do |logOnly|
    logOnly.source_files = 'Slog/Classes/Slog.*'
  end

end
