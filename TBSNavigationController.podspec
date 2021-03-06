#
# Be sure to run `pod lib lint TBSNavigationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TBSNavigationController'
  s.version          = '0.2.0'
  s.summary          = '自定义navigationController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
项目ViewController基类ViewDidLoad中执行reloadNavigationBar和removeNavigationBar创建和删除一个自定义的NavigationBar
                       DESC

  s.homepage         = 'https://github.com/fupenghua/TBSNavigationController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fupenghua' => '390908980@qq.com' }
  s.source           = { :git => 'https://github.com/fupenghua/TBSNavigationController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'TBSNavigationController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TBSNavigationController' => ['TBSNavigationController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
