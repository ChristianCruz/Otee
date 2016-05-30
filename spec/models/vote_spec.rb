desribe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect (@post.votes.value).to eq(true || false)
      end
    end
  end
end