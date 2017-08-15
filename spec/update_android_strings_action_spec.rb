describe Fastlane::Actions::UpdateAndroidStringsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_android_strings plugin is working!")

      Fastlane::Actions::UpdateAndroidStringsAction.run(nil)
    end
  end
end
