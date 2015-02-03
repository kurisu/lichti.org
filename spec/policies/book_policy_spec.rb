describe BookPolicy do
  subject { described_class }

  permissions :index?, :show? do
    it "should grant access to everyone" do
      expect(subject).to permit(nil, Book)
      expect(subject).to permit(User.new(:role => :user), Book)
      expect(subject).to permit(User.new(:role => :admin), Book)
    end
  end

  permissions :edit?, :new?, :create?, :update?, :destroy? do
    it 'should grant access only to admin users' do
      expect(subject).not_to permit(nil, Book.new)
      expect(subject).not_to permit(User.new(:role => :user), Book.new)
      expect(subject).to permit(User.new(:role => :admin), Book.new)
    end
  end
end