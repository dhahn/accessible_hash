require "spec_helper"

describe Hash do
  context "when using ruby 1.9.3" do
    let(:the_hash) { Hash.new }
    it "should have the make_accessible method" do
      the_hash.should respond_to :make_accessible
    end
    
    describe "make_accessible" do
      describe "used as an instance method" do
        before(:each) { the_hash.make_accessible }
        it "should return the original hash" do
          the_hash.make_accessible.should be the_hash
        end

        it "should mimic setters" do
          the_hash.should_not respond_to :foo=
          expect { the_hash.foo = "bar" }.not_to raise_exception
          the_hash[:foo].should eq "bar"
        end

        it "should mimic getters for valid key" do
          the_hash.should_not respond_to :foo
          the_hash[:foo] = "bar"
          expect { the_hash.foo }.not_to raise_exception
          the_hash.foo.should eq "bar"
        end

        it "should not mimic getters for invalid keys" do
          the_hash.keys.should_not include :foo
          expect { the_hash.foo }.to raise_exception
        end

        describe "concerning different value-types" do
          it "should work for arrays" do
            the_hash.foo = [?a, ?b, ?c]
            the_hash.foo.should eq [?a, ?b, ?c]
          end

          it "should work for hashes" do
            the_hash.foo = {a: ?a, b: ?b}
            the_hash.foo.should eq({a: ?a, b: ?b})
          end
        end
      end

      describe "used as a class method" do
        after(:all) do
          ::Hash.class_eval do
            remove_method :method_missing
          end
        end

        it "should be defined" do
          Hash.should respond_to :make_accessible
        end

        describe "after call" do
          before(:all) { Hash.make_accessible }
          it "should mimic setters" do
            the_hash.should_not respond_to :foo=
            expect { the_hash.foo = "bar" }.not_to raise_exception
            the_hash[:foo].should eq "bar"
          end

          it "should mimic getters for valid key" do
            the_hash.should_not respond_to :foo
            the_hash[:foo] = "bar"
            expect { the_hash.foo }.not_to raise_exception
            the_hash.foo.should eq "bar"
          end

          it "should not mimic getters for invalid keys" do
            the_hash.keys.should_not include :foo
            expect { the_hash.foo }.to raise_exception
          end

          describe "concerning different value-types" do
            it "should work for arrays" do
              the_hash.foo = [?a, ?b, ?c]
              the_hash.foo.should eq [?a, ?b, ?c]
            end

            it "should work for hashes" do
              the_hash.foo = {a: ?a, b: ?b}
              the_hash.foo.should eq({a: ?a, b: ?b})
            end
          end
        end
      end
    end
  end
end if RUBY_VERSION < "2.0"