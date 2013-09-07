require "spec_helper"

if RUBY_VERSION >= "2.0"
  describe Hash do
    context "when using ruby 2.0" do
      let(:the_hash) { Hash.new }

      it "should not respond to make_accessible" do
        the_hash.should_not respond_to :make_accessible
        Hash.should_not respond_to :make_accessible
      end

      context "before using AccessibleHash" do
        it "should not have getter methods" do
          the_hash[:foo] = "bar"
          expect { the_hash.foo }.to raise_exception
        end

        it "should not have setter methods" do
          expect { the_hash.foo = "bar" }.to raise_exception
        end
      end
    end
  end

  using AccessibleHash

  describe Hash do
    let(:the_hash) { Hash.new }
    context "when using ruby 2.0" do
      context "after using AccessibleHash" do
        it "should have getter methods" do
          the_hash[:foo] = "bar"
          expect { the_hash.foo }.not_to raise_exception
          the_hash.foo.should eq "bar"
        end

        it "should have setter methods" do
          expect { the_hash.foo = "bar" }.not_to raise_exception
          the_hash[:foo].should eq "bar"
        end
      end
    end
  end 
end