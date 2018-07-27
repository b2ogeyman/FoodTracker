project 'FoodTracker.xcodeproj'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
end

target 'FoodTracker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'LGButton'
  # Pods for FoodTracker
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'JSQMessagesViewController'

  target 'FoodTrackerTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
